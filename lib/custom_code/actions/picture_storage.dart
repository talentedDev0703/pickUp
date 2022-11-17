// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<String> pictureStorage(String? imagePath) async {
  // Add your function code here!

  String fileName = p.basename(imagePath!);
  String fileExtension = p.extension(imagePath);

  final path = 'file/${fileName}.${fileExtension}';
  final file = File(imagePath);

  final ref = FirebaseStorage.instance.ref().child(path);

  UploadTask? uploadTask = ref.putFile(file);

  final snapshot = await uploadTask.whenComplete(() {});

  return snapshot.ref.getDownloadURL();
}
