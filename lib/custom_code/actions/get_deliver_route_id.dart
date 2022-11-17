// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:developer' as developer;

Future<String> getDeliverRouteId(String userId) async {
  String id = "";
  CollectionReference ref = FirebaseFirestore.instance.collection('routes');
  await ref
      .where('userId', isEqualTo: userId)
      .where('status', isEqualTo: 'generated')
      .get()
      .then((value) {
    if (value.docs.isNotEmpty) {
      value.docs.forEach((doc) {
        id = doc.id;
      });
    }
  });
  return id;
}
