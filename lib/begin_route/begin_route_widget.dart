import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../show_all_routes/show_all_routes_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeginRouteWidget extends StatefulWidget {
  const BeginRouteWidget({Key? key}) : super(key: key);

  @override
  _BeginRouteWidgetState createState() => _BeginRouteWidgetState();
}

class _BeginRouteWidgetState extends State<BeginRouteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RoutesRecord>>(
      stream: queryRoutesRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<RoutesRecord> beginRouteRoutesRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final beginRouteRoutesRecord = beginRouteRoutesRecordList.isNotEmpty
            ? beginRouteRoutesRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(0, 1),
              child: FlutterFlowIconButton(
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                alignment: AlignmentDirectional(1, 1),
                children: [
                  Align(
                    alignment: AlignmentDirectional(1, 1),
                    child: Image.asset(
                      'assets/images/Vector_(12).png',
                      width: 219,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, -0.3),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5FFFA),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFFD5F3E5),
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Image.asset(
                              'assets/images/icon.png',
                              width: 67,
                              height: 76,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(45, 35, 45, 0),
                              child: Text(
                                'Take all of the items from staging zones A and B and place them in your delivery bag.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle1Family,
                                      fontSize: 20,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family),
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                            child: StreamBuilder<List<RoutesRecord>>(
                              stream: queryRoutesRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<RoutesRecord> buttonRoutesRecordList =
                                    snapshot.data!;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ShowAllRoutesWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                  text: 'Begin Route',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 53,
                                    color: Color(0xFF17CF77),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 18,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                    borderSide: BorderSide(
                                      color: Color(0xFF17CF77),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
