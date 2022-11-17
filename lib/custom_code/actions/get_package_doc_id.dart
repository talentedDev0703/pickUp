// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<String> getPackageDocId(String packageId) async {
  String result = "Initial";
  CollectionReference ref = FirebaseFirestore.instance.collection('packages');
  await ref.where('carrierPackageId', isEqualTo: packageId).get().then((value) {
    if (value.docs.isNotEmpty) {
      value.docs.forEach((doc) {
        result = doc.id;
      });
    } else {
      result = "No PackageId";
    }
  });
  return result;
}
