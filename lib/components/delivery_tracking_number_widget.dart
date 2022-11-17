import '../deliver_package/deliver_package_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryTrackingNumberWidget extends StatefulWidget {
  const DeliveryTrackingNumberWidget({Key? key}) : super(key: key);

  @override
  _DeliveryTrackingNumberWidgetState createState() =>
      _DeliveryTrackingNumberWidgetState();
}

class _DeliveryTrackingNumberWidgetState
    extends State<DeliveryTrackingNumberWidget> {
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
              setState(() => FFAppState().barcodeResult =
                  trackingNumberValueController!.text);
              if (FFAppState().barcodeResult != null &&
                  FFAppState().barcodeResult != '') {
                if (FFAppState().barcodeResult ==
                    FFAppState().carrierPackageId) {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliverPackageWidget(),
                    ),
                    (r) => false,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Scan process failed',
                        style: TextStyle(
                          color: Colors.white,
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
                      'Enter Correct Code',
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
