import '../auth/auth_util.dart';
import '../components/tracking_number_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../package_damaged/package_damaged_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageReceiveWidget extends StatefulWidget {
  const PackageReceiveWidget({Key? key}) : super(key: key);

  @override
  _PackageReceiveWidgetState createState() => _PackageReceiveWidgetState();
}

class _PackageReceiveWidgetState extends State<PackageReceiveWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? packageDocID;
  String? result;
  bool? isExist;
  dynamic? userLocation;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().isReceving = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            color: Color(0x0C00000D),
                            offset: Offset(0, 5),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFD5F3E5),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: Image.asset(
                                        'assets/images/scanner_corners.png',
                                      ).image,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 20, 10, 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFE2E2E2),
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: AlignmentDirectional(0, 0),
                                        children: [
                                          Image.asset(
                                            'assets/images/Group_(5).png',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 0),
                                            child: Image.asset(
                                              'assets/images/Line_11.png',
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.002,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 2, 20, 0),
                                child: Text(
                                  'Point your camera at the package tracking code',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 15,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        result = await actions.barcodeScanner();
                                        setState(() => FFAppState()
                                            .barcodeResult = result!);
                                        if (FFAppState().barcodeResult !=
                                                null &&
                                            FFAppState().barcodeResult != '') {
                                          // determinePacakgeIdAvailable
                                          isExist = await actions
                                              .isPackageIdAvailable(
                                            FFAppState().barcodeResult,
                                          );
                                          if (isExist!) {
                                            // getPackageDocId
                                            packageDocID =
                                                await actions.getPackageDocId(
                                              FFAppState().barcodeResult,
                                            );
                                            setState(() =>
                                                FFAppState().damagePackageId =
                                                    valueOrDefault<String>(
                                                  FFAppState().barcodeResult,
                                                  'd',
                                                ));
                                            // addRecordToEvent
                                            await actions.createScanEvent(
                                              valueOrDefault<String>(
                                                packageDocID,
                                                'kk',
                                              ),
                                              valueOrDefault<String>(
                                                currentUserUid,
                                                'd',
                                              ),
                                              valueOrDefault<String>(
                                                currentUserLocationValue
                                                    ?.toString(),
                                                'eee',
                                              ),
                                            );
                                            // GoToDamagePage
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PackageDamagedWidget(),
                                              ),
                                              (r) => false,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'There is no package.',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          }
                                        } else {
                                          // viewError
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Enter Code Or Scan Barcode First...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                      text: 'Scan',
                                      icon: Icon(
                                        Icons.photo_camera,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        height: 53,
                                        color: Color(0xFF434342),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 18,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // bottomSheet
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: TrackingNumberWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: 'Enter Tracking Number Manually',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 53,
                        color: Color(0xFF434342),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        userLocation = await actions.getUserlocation(
                          currentUserUid,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              valueOrDefault<String>(
                                userLocation,
                                'v',
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0x00000000),
                          ),
                        );
                        await actions.createRouteDoc(
                          currentUserUid,
                          userLocation!,
                          userLocation!,
                        );
                        setState(() => FFAppState().barcodeResult = '');
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NavBarPage(initialPage: 'Packages'),
                          ),
                          (r) => false,
                        );

                        setState(() {});
                      },
                      text: 'Done Receiving Packages',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 53,
                        color: Color(0xFF17CF77),
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText1
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontSize: 18,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                        borderSide: BorderSide(
                          color: Color(0xFF17CF77),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
