import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/reason_text_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../routes_complete/routes_complete_widget.dart';
import '../show_next_stop/show_next_stop_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnableToDeliverWidget extends StatefulWidget {
  const UnableToDeliverWidget({Key? key}) : super(key: key);

  @override
  _UnableToDeliverWidgetState createState() => _UnableToDeliverWidgetState();
}

class _UnableToDeliverWidgetState extends State<UnableToDeliverWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
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
        List<UsersRecord> unableToDeliverUsersRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final unableToDeliverUsersRecord =
            unableToDeliverUsersRecordList.isNotEmpty
                ? unableToDeliverUsersRecordList.first
                : null;
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
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Stack(
                  alignment: AlignmentDirectional(1, 1),
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(100, 50, 0, 0),
                      child: Image.asset(
                        'assets/images/Vector_(4).png',
                        width: 273,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.25),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.width * 0.32,
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
                                'assets/images/Vector_(9).png',
                                width: 56,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 40, 20, 40),
                                child: Text(
                                  'Why can’t this package be delivered?',
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
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  await actions.createErrorDeliveryEvent(
                                    valueOrDefault<String>(
                                      FFAppState().currentPackageId,
                                      'er',
                                    ),
                                    valueOrDefault<String>(
                                      currentUserUid,
                                      'rt',
                                    ),
                                    valueOrDefault<String>(
                                      currentUserLocationValue?.toString(),
                                      'er',
                                    ),
                                    0,
                                    'noOther',
                                  );
                                  setState(() =>
                                      FFAppState().currentPackageOrder =
                                          FFAppState().currentPackageOrder + 1);
                                  setState(() => FFAppState().leftPackageCount =
                                      FFAppState().leftPackageCount + -1);
                                  setState(() => FFAppState()
                                          .undeliverablePackageCount =
                                      FFAppState().undeliverablePackageCount +
                                          1);
                                  if (FFAppState().currentPackageOrder >
                                      FFAppState().packageCount) {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RoutesCompleteWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  } else {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ShowNextStopWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  }
                                },
                                text: 'Recipient not Home',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 53,
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Color(0xFF434342),
                                        fontSize: 18,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF434342),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  await actions.createErrorDeliveryEvent(
                                    valueOrDefault<String>(
                                      FFAppState().currentPackageId,
                                      'er',
                                    ),
                                    valueOrDefault<String>(
                                      currentUserUid,
                                      'rt',
                                    ),
                                    valueOrDefault<String>(
                                      currentUserLocationValue?.toString(),
                                      'er',
                                    ),
                                    1,
                                    'noOther',
                                  );
                                  setState(() =>
                                      FFAppState().currentPackageOrder =
                                          FFAppState().currentPackageOrder + 1);
                                  setState(() => FFAppState().leftPackageCount =
                                      FFAppState().leftPackageCount + -1);
                                  setState(() => FFAppState()
                                          .undeliverablePackageCount =
                                      FFAppState().undeliverablePackageCount +
                                          1);
                                  if (FFAppState().currentPackageOrder >
                                      FFAppState().packageCount) {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RoutesCompleteWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  } else {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ShowNextStopWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  }
                                },
                                text: 'Can’t get to Address',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 53,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 18,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF434342),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  await actions.createErrorDeliveryEvent(
                                    valueOrDefault<String>(
                                      FFAppState().currentPackageId,
                                      'er',
                                    ),
                                    valueOrDefault<String>(
                                      currentUserUid,
                                      'rt',
                                    ),
                                    valueOrDefault<String>(
                                      currentUserLocationValue?.toString(),
                                      'er',
                                    ),
                                    2,
                                    'noOther',
                                  );
                                  setState(() =>
                                      FFAppState().currentPackageOrder =
                                          FFAppState().currentPackageOrder + 1);
                                  setState(() => FFAppState().leftPackageCount =
                                      FFAppState().leftPackageCount + -1);
                                  setState(() => FFAppState()
                                          .undeliverablePackageCount =
                                      FFAppState().undeliverablePackageCount +
                                          1);
                                  if (FFAppState().currentPackageOrder >
                                      FFAppState().packageCount) {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RoutesCompleteWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  } else {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ShowNextStopWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  }
                                },
                                text: 'Address does not exist',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 53,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 18,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF434342),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: double.infinity,
                                          child: ReasonTextWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'Other (Enter Reason)',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 53,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 18,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF434342),
                                    width: 2,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
