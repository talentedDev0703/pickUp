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

Future<String> getPackageAddress(String packageId) async {
  String address = "";
  String geoCode = "";
  String receiver = "";
  CollectionReference ref = FirebaseFirestore.instance.collection('packages');
  await ref.doc(packageId).get().then((DocumentSnapshot result) {
    if (result.exists) {
      String addressString = jsonEncode(result["shipTo"]);
      var addressData = jsonDecode(addressString);
      address = addressData["fullAddress"];
      geoCode = addressData["geoCode"];
      receiver = addressData["fullName"];
      int index = geoCode.indexOf(",");
      String latitude = geoCode.substring(0, index - 1);
      String longitude = geoCode.substring(index + 1);
      LatLng packageAddress =
          new LatLng(double.parse(latitude), double.parse(longitude));
      FFAppState().packageGeoCode = packageAddress;
      FFAppState().receiverName = receiver;
    }
  });
  return address;
}
