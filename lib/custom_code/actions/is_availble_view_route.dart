// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<bool> isAvailbleViewRoute(String routeId) async {
  bool result = false;
  CollectionReference ref = FirebaseFirestore.instance.collection('routes');
  await ref.doc(routeId).collection("packages").get().then((value) {
    if (value.docs.isNotEmpty) {
      result = true;
    }
  });
  return result;
}
