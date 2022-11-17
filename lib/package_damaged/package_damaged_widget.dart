import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../package_damaged_picture/package_damaged_picture_widget.dart';
import '../package_receive/package_receive_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageDamagedWidget extends StatefulWidget {
  const PackageDamagedWidget({Key? key}) : super(key: key);

  @override
  _PackageDamagedWidgetState createState() => _PackageDamagedWidgetState();
}

class _PackageDamagedWidgetState extends State<PackageDamagedWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? packageDocId;

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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
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
                alignment: AlignmentDirectional(0, -0.25),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Is Package damaged?',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 23,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: StreamBuilder<List<PackagesRecord>>(
                                stream: queryPackagesRecord(
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PackagesRecord>
                                      buttonPackagesRecordList = snapshot.data!;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final buttonPackagesRecord =
                                      buttonPackagesRecordList.isNotEmpty
                                          ? buttonPackagesRecordList.first
                                          : null;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      packageDocId =
                                          await actions.getPackageDocId(
                                        FFAppState().damagePackageId,
                                      );
                                      await actions.updateDamageField(
                                        valueOrDefault<String>(
                                          packageDocId,
                                          'ewrr',
                                        ),
                                      );
                                      await actions.createDamageEvent(
                                        valueOrDefault<String>(
                                          packageDocId,
                                          'www',
                                        ),
                                        currentUserUid,
                                        valueOrDefault<String>(
                                          currentUserLocationValue?.toString(),
                                          '3333',
                                        ),
                                      );
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PackageDamagedPictureWidget(),
                                        ),
                                      );

                                      setState(() {});
                                    },
                                    text: 'Yes',
                                    options: FFButtonOptions(
                                      width: 170,
                                      height: 137,
                                      color: Color(0xFF434342),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PackageReceiveWidget(),
                                    ),
                                    (r) => false,
                                  );
                                  if (FFAppState().isReceving == true) {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PackageReceiveWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  } else {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NavBarPage(initialPage: 'Packages'),
                                      ),
                                      (r) => false,
                                    );
                                  }
                                },
                                text: 'No',
                                options: FFButtonOptions(
                                  width: 170,
                                  height: 137,
                                  color: Color(0xFF17CF77),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
