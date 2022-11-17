// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:intercom_flutter/intercom_flutter.dart';

Future openSupportChatWithMSG(String carrierPackageID) async {
  await Intercom.instance
      .displayMessageComposer("I have an issue with package $carrierPackageID");
}
