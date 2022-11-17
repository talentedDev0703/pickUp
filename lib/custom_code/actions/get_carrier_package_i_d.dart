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

Future<String> getCarrierPackageID(String packageInfo) async {
  var packageData = jsonDecode(packageInfo);
  return packageData["carrierPackageId"];
}
