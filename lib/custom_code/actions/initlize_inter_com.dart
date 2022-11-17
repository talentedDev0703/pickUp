// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:intercom_flutter/intercom_flutter.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

Future initlizeInterCom(String uID) async {
  try {
    await Intercom.instance.initialize('aqgwuxvc',
        iosApiKey: 'ios_sdk-b37839c149ad0fd63f2e913a6dbd61ac624e6c46',
        androidApiKey: 'android_sdk-77aec8b97627bf2cd043bff9c2db7f479620f141');

    await Intercom.instance.loginIdentifiedUser(
        userId: uID,
        statusCallback:
            IntercomStatusCallback(onSuccess: () {}, onFailure: (value) {}));

    final firebaseMessaging = FirebaseMessaging.instance;
    final intercomToken = Platform.isIOS
        ? await firebaseMessaging.getAPNSToken()
        : await firebaseMessaging.getToken();

    if (intercomToken != null) {
      await Intercom.instance.sendTokenToIntercom(intercomToken);
    }
  } catch (e) {
    print(e);
  }
}
