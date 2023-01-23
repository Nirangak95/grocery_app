import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../utils/alert_helper.dart';

class AdminController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Create user collection refference
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

// -------------- Save Product Info
  Future<void> saveProductInfo(
    BuildContext context,
    String productName,
    String description,
    String price,
  ) async {
    try {
      AlertHelper.showAlert(context, DialogType.success, "SUCCESS",
          "User created successfully !");
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.code);
    } catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.toString());
    }
  }
}
