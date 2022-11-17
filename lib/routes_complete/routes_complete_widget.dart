import '../backend/backend.dart';
import '../components/review_text_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutesCompleteWidget extends StatefulWidget {
  const RoutesCompleteWidget({Key? key}) : super(key: key);

  @override
  _RoutesCompleteWidgetState createState() => _RoutesCompleteWidgetState();
}

class _RoutesCompleteWidgetState extends State<RoutesCompleteWidget> {
  double? ratingBarValue;
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
                alignment: AlignmentDirectional(0, -0.3),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Image.asset(
                          'assets/images/Vector_(5).png',
                          width: MediaQuery.of(context).size.width * 0.17,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Text(
                          'Route Complete',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 16,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 0),
                        child: Text(
                          'It\'s time to head home. Thanks for your hard work.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 16,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 45),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.125,
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
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFE7E7E7),
                              width: 2,
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'You have',
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
                                Text(
                                  FFAppState()
                                      .undeliverablePackageCount
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .subtitle1Family,
                                        fontSize: 15,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle1Family),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    'undeliverable packages. ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          fontSize: 15,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(75, 0, 75, 0),
                        child: Text(
                          'How was your Pickups experience?',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: RatingBar.builder(
                          onRatingUpdate: (newValue) =>
                              setState(() => ratingBarValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_purple500_outlined,
                            color: Color(0xFFFFD910),
                          ),
                          direction: Axis.horizontal,
                          initialRating: ratingBarValue ??= 0,
                          unratedColor:
                              FlutterFlowTheme.of(context).tertiaryColor,
                          itemCount: 5,
                          itemPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          itemSize: 28,
                          glowColor: Color(0xFFFFD910),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: StreamBuilder<List<RoutesRecord>>(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<RoutesRecord> buttonRoutesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonRoutesRecord =
                                buttonRoutesRecordList.isNotEmpty
                                    ? buttonRoutesRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                await actions.updateRouteStatus(
                                  FFAppState().currentRouteId,
                                  'Completed',
                                );
                                setState(() =>
                                    FFAppState().ratingStars = ratingBarValue!);
                                setState(
                                    () => FFAppState().currentPackageOrder = 0);
                                setState(
                                    () => FFAppState().packageAddress = '');
                                setState(() => FFAppState().packageCount = 0);
                                setState(
                                    () => FFAppState().currentPackageId = '');
                                setState(() => FFAppState().packageType = '');
                                setState(
                                    () => FFAppState().carrierPackageId = '');
                                setState(
                                    () => FFAppState().leftPackageCount = 0);
                                setState(() =>
                                    FFAppState().undeliverablePackageCount = 0);
                                if (ratingBarValue! < 4.0) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: ReviewTextWidget(),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                } else {
                                  await actions.createRating(
                                    FFAppState().currentRouteId,
                                    valueOrDefault<String>(
                                      FFAppState().ratingStars.toString(),
                                      'e',
                                    ),
                                    ' ',
                                  );
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NavBarPage(initialPage: 'Deliveries'),
                                    ),
                                    (r) => false,
                                  );
                                }
                              },
                              text: 'Sumbit',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 53,
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
                                  color: Colors.transparent,
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
  }
}
