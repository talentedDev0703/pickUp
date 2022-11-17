import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../package_receive/package_receive_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageDamagedPictureWidget extends StatefulWidget {
  const PackageDamagedPictureWidget({Key? key}) : super(key: key);

  @override
  _PackageDamagedPictureWidgetState createState() =>
      _PackageDamagedPictureWidgetState();
}

class _PackageDamagedPictureWidgetState
    extends State<PackageDamagedPictureWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  String? packageDocId;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: Align(
            alignment: AlignmentDirectional(0, 0),
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
                  alignment: AlignmentDirectional(0, -0.8),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.62,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: Image.asset(
                                    'assets/images/scanner_corners_(1).png',
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 25),
                                          child: Text(
                                            'Take a photo of the damaged package',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontSize: 16,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 25, 0, 0),
                                        child:
                                            StreamBuilder<List<PackagesRecord>>(
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
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PackagesRecord>
                                                buttonPackagesRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the document does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final buttonPackagesRecord =
                                                buttonPackagesRecordList
                                                        .isNotEmpty
                                                    ? buttonPackagesRecordList
                                                        .first
                                                    : null;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                currentUserLocationValue =
                                                    await getCurrentUserLocation(
                                                        defaultLocation:
                                                            LatLng(0.0, 0.0));
                                                final selectedMedia =
                                                    await selectMedia(
                                                  imageQuality: 100,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() =>
                                                      isMediaUploading = true);
                                                  var downloadUrls = <String>[];
                                                  try {
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    isMediaUploading = false;
                                                  }
                                                  if (downloadUrls.length ==
                                                      selectedMedia.length) {
                                                    setState(() =>
                                                        uploadedFileUrl =
                                                            downloadUrls.first);
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                if (uploadedFileUrl != null &&
                                                    uploadedFileUrl != '') {
                                                  packageDocId = await actions
                                                      .getPackageDocId(
                                                    FFAppState().barcodeResult,
                                                  );
                                                  await actions
                                                      .createDamageImage(
                                                    uploadedFileUrl,
                                                    valueOrDefault<String>(
                                                      packageDocId,
                                                      '111',
                                                    ),
                                                    currentUserUid,
                                                    valueOrDefault<String>(
                                                      currentUserLocationValue
                                                          ?.toString(),
                                                      'eeee',
                                                    ),
                                                  );
                                                  setState(() => FFAppState()
                                                      .isURL = true);
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PackageReceiveWidget(),
                                                    ),
                                                    (r) => false,
                                                  );
                                                  setState(() => FFAppState()
                                                      .isURL = false);
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'No File Selected',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              text: 'Take Photo',
                                              icon: Icon(
                                                Icons.image,
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                height: 53,
                                                color: Color(0xFF434342),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Color(0xFF17CF77),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (FFAppState().isURL)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              await actions.copyCodeClipboard(
                                                uploadedFileUrl,
                                              );
                                            },
                                            child: Image.network(
                                              uploadedFileUrl,
                                              width: 200,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
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
          ),
        ),
      ),
    );
  }
}
