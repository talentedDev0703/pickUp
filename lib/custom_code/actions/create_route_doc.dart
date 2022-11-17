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

Future createRouteDoc(String userId, Map startLoc, Map endLoc) async {
  CollectionReference ref = FirebaseFirestore.instance.collection('routes');
  await ref
      .where("userId", isEqualTo: userId)
      .where("status", isEqualTo: "generated")
      .get()
      .then((datas) {
    if (datas.docs.isNotEmpty) {
      datas.docs.forEach((doc) {
        doc.reference.update({"status": "voided"});
      });
    }
  });
  await ref.add({
    "userId": userId,
    "startLocation": startLoc,
    "endLocation": endLoc,
    "createdAt": DateTime.now(),
    "status": "generated"
  });
}
