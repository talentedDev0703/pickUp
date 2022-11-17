import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class IntercomSupportWidget extends StatefulWidget {
  const IntercomSupportWidget({Key? key}) : super(key: key);

  @override
  _IntercomSupportWidgetState createState() => _IntercomSupportWidgetState();
}

class _IntercomSupportWidgetState extends State<IntercomSupportWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initlizeInterCom(
        currentUserUid,
      );
      await actions.openIntercom();
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavBarPage(initialPage: 'Packages'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
    );
  }
}
