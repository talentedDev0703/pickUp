// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future updateUserInfo(String userId, String phoneNum, String address) async {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  await ref.doc(userId).update({"phoneNumber": phoneNum});
  await ref
      .doc(userId)
      .collection("addresses")
      .where("type", isEqualTo: "home")
      .get()
      .then((documents) {
    if (documents.size > 0) {
      documents.docs.forEach((doc) {
        if (doc.data()["type"] == "home") {
          doc.reference.update({
            "value": {
              "fullAddress": address,
            }
          });
        }
      });
    } else {
      ref.doc(userId).collection("addresses").add({
        "type": "home",
        "value": {
          "fullAddress": address,
        }
      });
    }
  });
}
