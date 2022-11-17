// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

Future copyCodeClipboard(String? code) async {
  // Add your function code here!

  Clipboard.setData(ClipboardData(text: code)).then((value) {
    Fluttertoast.showToast(
        msg: "Code Copied!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orangeAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  });
}
