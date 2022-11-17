// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<String> getPackageIDFromOrder(String routeId, int order) async {
  String packageId = "";
  CollectionReference ref = FirebaseFirestore.instance.collection('routes');
  await ref
      .doc(routeId)
      .collection("packages")
      .where("deliveryOrder", isEqualTo: order)
      .get()
      .then((value) {
    value.docs.forEach((doc) {
      packageId = doc.data()["packageId"];
    });
  });
  return packageId;
}
