import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../package_damaged/package_damaged_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackingNumberWidget extends StatefulWidget {
  const TrackingNumberWidget({Key? key}) : super(key: key);

  @override
  _TrackingNumberWidgetState createState() => _TrackingNumberWidgetState();
}

class _TrackingNumberWidgetState extends State<TrackingNumberWidget> {
  LatLng? currentUserLocationValue;
  String? packageDocID;
  bool? isExist;
  TextEditingController? trackingNumberValueController;

  @override
  void initState() {
    super.initState();
    trackingNumberValueController = TextEditingController();
  }

  @override
  void dispose() {
    trackingNumberValueController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 285,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
      ),
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
            child: Text(
              'Enter Tracking number Manually',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Gilroy',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Container(
              width: 238,
              height: 59,
              decoration: BoxDecoration(
                color: Color(0xFFF5FFFA),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    color: Color(0x0C00000D),
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xFFE7E7E7),
                  width: 2,
                ),
              ),
              alignment: AlignmentDirectional(0, 0),
              child: TextFormField(
                controller: trackingNumberValueController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Enter Tracking Number',
                  hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText2Family,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText2Family),
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
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
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: Colors.black,
                      fontSize: 20,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              currentUserLocationValue = await getCurrentUserLocation(
                  defaultLocation: LatLng(0.0, 0.0));
              setState(() => FFAppState().barcodeResult =
                  trackingNumberValueController!.text);
              if (FFAppState().barcodeResult != null &&
                  FFAppState().barcodeResult != '') {
                // determinePacakgeIdAvailable
                isExist = await actions.isPackageIdAvailable(
                  FFAppState().barcodeResult,
                );
                if (isExist!) {
                  // getPackageDocId
                  packageDocID = await actions.getPackageDocId(
                    FFAppState().barcodeResult,
                  );
                  setState(() =>
                      FFAppState().damagePackageId = valueOrDefault<String>(
                        FFAppState().barcodeResult,
                        's',
                      ));
                  // addRecordToEvent
                  await actions.createScanEvent(
                    valueOrDefault<String>(
                      packageDocID,
                      'ds',
                    ),
                    valueOrDefault<String>(
                      currentUserUid,
                      'd',
                    ),
                    valueOrDefault<String>(
                      currentUserLocationValue?.toString(),
                      'eee',
                    ),
                  );
                  // GoToDamagePage
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PackageDamagedWidget(),
                    ),
                    (r) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'There is no package.',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0x00000000),
                    ),
                  );
                }
              } else {
                // viewError
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Enter Code Or Scan Barcode First...',
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).subtitle2Family,
                            color: FlutterFlowTheme.of(context).primaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).subtitle2Family),
                          ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: Color(0x00000000),
                  ),
                );
              }

              setState(() {});
            },
            text: 'Continue',
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme.of(context).alternate,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).subtitle2Family),
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
