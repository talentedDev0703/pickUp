// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:convert';

Future<String> getPackageInfo(String packageId) async {
  String packageData = "";
  CollectionReference ref = FirebaseFirestore.instance.collection('packages');
  await ref.doc(packageId).get().then((DocumentSnapshot result) {
    if (result.exists) {
      var info = {
        "carrierPackageId": result["carrierPackageId"],
        "type": result["rate"]
      };
      String stringInfo = jsonEncode(info);
      packageData = stringInfo;
    }
  });
  return packageData;
}
