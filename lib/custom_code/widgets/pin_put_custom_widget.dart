// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter_verification_code/flutter_verification_code.dart';

class PinPutCustomWidget extends StatefulWidget {
  const PinPutCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _PinPutCustomWidgetState createState() => _PinPutCustomWidgetState();
}

class _PinPutCustomWidgetState extends State<PinPutCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: VerificationCode(
        keyboardType: TextInputType.number,
        textStyle: TextStyle(
            color: Color(0xff17CF77),
            fontSize: 35,
            fontWeight: FontWeight.w900),
        length: 6,
        autofocus: true,
        underlineColor: const Color(0xff17CF77),
        underlineUnfocusedColor: const Color(0xffDEDEDE),
        onCompleted: (String value) {
          print(value);
          setState(() {
            FFAppState().OTP = value;
          });
        },
        onEditing: (bool value) {},
      ),
    );
  }
}
