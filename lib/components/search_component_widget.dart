import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class SearchComponentWidget extends StatefulWidget {
  const SearchComponentWidget({Key? key}) : super(key: key);

  @override
  _SearchComponentWidgetState createState() => _SearchComponentWidgetState();
}

class _SearchComponentWidgetState extends State<SearchComponentWidget> {
  List<PackagesRecord> simpleSearchResults = [];
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(),
            child: TextFormField(
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Enter Pacakage ID',
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText2Family,
                      fontSize: 20,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText2Family),
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF17CF77),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF17CF77),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF959595),
                  size: 20,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                    fontSize: 25,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: InkWell(
            onTap: () async {
              setState(() => FFAppState().showFullList = true);
            },
            child: Icon(
              Icons.cancel,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
          ),
        ),
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 40,
          fillColor: FlutterFlowTheme.of(context).alternate,
          icon: Icon(
            Icons.search,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20,
          ),
          onPressed: () async {
            await queryPackagesRecordOnce()
                .then(
                  (records) => simpleSearchResults = TextSearch(
                    records
                        .map(
                          (record) => TextSearchItem(
                              record, [record.carrierPackageId!]),
                        )
                        .toList(),
                  ).search(textController!.text).map((r) => r.object).toList(),
                )
                .onError((_, __) => simpleSearchResults = [])
                .whenComplete(() => setState(() {}));

            setState(() => FFAppState().showFullList = false);
          },
        ),
      ],
    );
  }
}
