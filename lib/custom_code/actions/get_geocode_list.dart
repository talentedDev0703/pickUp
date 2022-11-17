// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<List<String>> getGeocodeList(String routeId) async {
  List<String> geoList = [];
  int order = 0;
  CollectionReference ref = FirebaseFirestore.instance.collection('routes');
  await ref
      .doc(routeId)
      .collection("packages")
      .orderBy("deliveryOrder")
      .get()
      .then((value) {
    value.docs.forEach((doc) {
      geoList.add(doc.data()["geoCode"]);
    });
  });
  return geoList;
}
