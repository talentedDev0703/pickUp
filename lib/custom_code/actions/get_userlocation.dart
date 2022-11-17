// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<Map> getUserlocation(String userId) async {
  Map result = Map();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  await ref.doc(userId).collection('addresses').get().then((value) {
    if (value.docs.isNotEmpty) {
      value.docs.forEach((doc) {
        if (doc.data()['type'] == "home") {
          result = doc.data()['value'];
        }
      });
    }
  });
  return result;
}
