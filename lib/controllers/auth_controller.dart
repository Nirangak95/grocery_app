import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../models/objects.dart';
import '../utils/alert_helper.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Create user collection refference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        //Save user other data

        await saveUserData(credential.user!.uid, name, email);

        AlertHelper.showAlert(context, DialogType.success, "SUCCESS",
            "User created successfully !");
      }
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.code);
    } catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.toString());
    }
  }

  Future<void> signInUser(
      BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //We don't need below code. because firebase states changes automatically redirect to home Screen
      //     .then((value) {
      //   if (value.user != null) {
      //     UtilFunctions.navigateTo(context, MainScreen());
      //   }
      // });
    } on FirebaseAuthException catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.code);
    } catch (e) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.toString());
    }
  }

  //Sign out user
  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> sendPassResetEmail(BuildContext context, String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      AlertHelper.showAlert(context, DialogType.success, "Email Sent !",
          "Please check your inbox !");
    });
  }

  //------------------------- Save User Data ---------------------

  Future<void> saveUserData(String uid, String name, String email) async {
    return users
        .doc(uid)
        .set(
          {
            'uid': uid,
            'name': name,
            'email': email,
          },
          SetOptions(merge: true),
        )
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  //------------------------- Fetch User Data ---------------------
  Future<UserModel?> fetchUserData(String uid) async {
    try {
      DocumentSnapshot snapshot = await users.doc(uid).get();

      UserModel model =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);

      Logger().i(model.name);

      return model;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
