// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future createErrorDeliveryEvent(String packageDocId, String userId,
    String geoCode, int kind, String otherReason) async {
  String description = "";
  if (kind == 0) {
    description = "Delivery Attempted(Recipent not home)";
  } else if (kind == 1) {
    description = "Delivery Attempted(Can't get to address)";
  } else if (kind == 2) {
    description = "Delivery Attempted(Address does not exist)";
  } else {
    description = 'Delivery Attempted($otherReason)';
  }
  String subString = geoCode.substring(12);
  int idx = subString.indexOf(",");
  String lang = subString.substring(0, idx);
  String longSubString = subString.substring(idx);
  String long = longSubString.substring(7);
  String geoTmpString = '$lang, $long';
  int secondIdx = geoTmpString.indexOf(")");
  String geoString = geoTmpString.substring(0, secondIdx);
  CollectionReference ref = FirebaseFirestore.instance.collection('packages');
  await ref.doc(packageDocId).collection('events').doc().set({
    "description": description,
    "userId": userId,
    "occurredAt": DateTime.now(),
    "geoCode": geoString,
  });
}
