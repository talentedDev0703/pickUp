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

Future createDamageImage(
    String imgUrl, String packageDocId, String userId, String geoCode) async {
  var metaData = {
    "context": "DamageReport",
    "packageID": packageDocId,
    "userID": userId,
    "geoCode": geoCode,
    "capturedAt": DateTime.now(),
  };
  CollectionReference ref = FirebaseFirestore.instance.collection('packages');
  await ref.doc(packageDocId).collection('images').doc().set({
    "url": imgUrl,
    "metaData": metaData,
  });
}
