import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../utils/alert_helper.dart';
import 'file_upload_controller.dart';

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
    File image,
  ) async {
    try {
      //------ Upload the image file
      UploadTask? task =
          FileUploadController.uploadFile(image, 'productImages');

      final snapshot = await task!.whenComplete(() {});

      //------- Getting the download URL
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      //Getting the unique document ID
      String docId = products.doc().id;

      //Saving  the products data in cloud Firestore
      await products.doc(docId).set(
        {
          'id': docId,
          'productName': productName,
          'description': description,
          'price': double.parse(price),
          'imageUrl': downloadUrl
        },
      );

      AlertHelper.showAlert(context, DialogType.success, "SUCCESS",
          "User created successfully !");
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.code);
    } catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.toString());
    }
  }
}
