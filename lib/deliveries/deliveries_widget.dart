import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../show_all_routes/show_all_routes_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveriesWidget extends StatefulWidget {
  const DeliveriesWidget({Key? key}) : super(key: key);

  @override
  _DeliveriesWidgetState createState() => _DeliveriesWidgetState();
}

class _DeliveriesWidgetState extends State<DeliveriesWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? routeId;
  int? packageCount;
  List<String>? geoList;
  bool? isAvailable;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      routeId = await actions.getDeliverRouteId(
        currentUserUid,
      );
      setState(() => FFAppState().currentRouteId = routeId!);
      packageCount = await actions.getDeliverPackageCount(
        valueOrDefault<String>(
          FFAppState().currentRouteId,
          '232',
        ),
      );
      setState(() => FFAppState().packageCount = packageCount!);
      setState(() => FFAppState().leftPackageCount = packageCount!);
      if (FFAppState().packageCount == 0) {
        setState(() => FFAppState().isDeliverablePackage = false);
      } else {
        setState(() => FFAppState().isDeliverablePackage = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
              Stack(
                children: [
                  if (FFAppState().isDeliverablePackage)
                    Align(
                      alignment: AlignmentDirectional(0, -0.25),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Text(
                                        FFAppState().packageCount.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1Family,
                                              fontSize: 20,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1Family),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Text(
                                        ' Packages to deliver',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1Family,
                                              fontSize: 20,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1Family),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: Text(
                                    '',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 16,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 81, 0, 0),
                                child: StreamBuilder<List<RoutesRecord>>(
                                  stream: queryRoutesRecord(
                                    queryBuilder: (routesRecord) => routesRecord
                                        .where('userId',
                                            isEqualTo: currentUserUid)
                                        .where('status',
                                            isEqualTo: 'generated'),
                                  ),
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
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        isAvailable =
                                            await actions.isAvailbleViewRoute(
                                          valueOrDefault<String>(
                                            FFAppState().currentRouteId,
                                            '32',
                                          ),
                                        );
                                        if (isAvailable!) {
                                          geoList =
                                              await actions.getGeocodeList(
                                            FFAppState().currentRouteId,
                                          );
                                          setState(() => FFAppState()
                                              .geoCodeList = geoList!.toList());
                                          setState(() => FFAppState()
                                              .currentPackageOrder = 0);
                                          setState(() =>
                                              FFAppState().startAddress =
                                                  currentUserLocationValue);
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ShowAllRoutesWidget(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Three is no route to preview',
                                                style: TextStyle(
                                                  color: Colors.white,
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
                                      text: 'Preview Route',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 18,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                    ),
                  if (!FFAppState().isDeliverablePackage)
                    Align(
                      alignment: AlignmentDirectional(0, -0.2),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
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
                                  'assets/images/icon_(6).png',
                                  width: 55,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 25, 0, 0),
                                  child: Text(
                                    'You have no deliveries',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 40),
                                  child: Text(
                                    ' Time to relax.',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 35,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1Family),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
