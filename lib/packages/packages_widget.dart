import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/set_address_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../package_details/package_details_widget.dart';
import '../package_receive/package_receive_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class PackagesWidget extends StatefulWidget {
  const PackagesWidget({Key? key}) : super(key: key);

  @override
  _PackagesWidgetState createState() => _PackagesWidgetState();
}

class _PackagesWidgetState extends State<PackagesWidget> {
  String? userAddress;
  bool? isAny;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      isAny = await actions.getPackages(
        currentUserUid,
      );
      setState(() => FFAppState().isAnyPackage = isAny!);
      userAddress = await actions.getUserAddress(
        currentUserUid,
      );
      setState(() => FFAppState().address = userAddress!);
      if (FFAppState().address == null || FFAppState().address == '') {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: 300,
                child: SetAddressWidget(),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }
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
        title: Text(
          'My Packages',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Gilroy',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title3Family),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Stack(
              alignment: AlignmentDirectional(1, 1),
              children: [
                Container(
                  width: 219,
                  height: 220,
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'assets/images/Vector_(12).png',
                    width: 219,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: !FFAppState().isAnyPackage,
                        child: Align(
                          alignment: AlignmentDirectional(0, -0.2),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 139,
                                    height: 139,
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
                                        'You have no packages',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              fontSize: 20,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 35,
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Stack(
                        alignment: AlignmentDirectional(0, 0.75),
                        children: [
                          if (FFAppState().isAnyPackage)
                            Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 0, 25, 100),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().showFullList)
                                              StreamBuilder<
                                                  List<PackagesRecord>>(
                                                stream: queryPackagesRecord(
                                                  queryBuilder: (packagesRecord) =>
                                                      packagesRecord
                                                          .where('status',
                                                              isEqualTo:
                                                                  'In Transit')
                                                          .where('withUser',
                                                              isEqualTo:
                                                                  currentUserUid),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<PackagesRecord>
                                                      listViewPackagesRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewPackagesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewPackagesRecord =
                                                          listViewPackagesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 15,
                                                                    0, 1),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PackageDetailsWidget(
                                                                  packageId:
                                                                      listViewPackagesRecord
                                                                          .carrierPackageId,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      25,
                                                                  color: Color(
                                                                      0x0C00000D),
                                                                  offset:
                                                                      Offset(
                                                                          0, 5),
                                                                  spreadRadius:
                                                                      0,
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFFF4F4F4),
                                                                width: 2,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/icon_(1).png',
                                                                    width: 58,
                                                                    height: 58,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                    .isAnyPackage)
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              20,
                                                                              0,
                                                                              0,
                                                                              20),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'Package ID',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        fontSize: 15,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  dateTimeFormat('yMMMd', getCurrentTimestamp),
                                                                                  style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                        fontSize: 11,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                5,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              listViewPackagesRecord.carrierPackageId!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                    fontSize: 14,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
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
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 25),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PackageReceiveWidget(),
                                        ),
                                      );
                                    },
                                    text: 'Receive Packages',
                                    options: FFButtonOptions(
                                      width: 50,
                                      height: 53,
                                      color: Color(0xFF17CF77),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 15,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
