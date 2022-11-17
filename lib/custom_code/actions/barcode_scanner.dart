// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<String?> barcodeScanner() async {
  // Add your function code here!

  String? qrResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', 'Cancel', true, ScanMode.BARCODE);

  return qrResult ?? 'null string';
}
