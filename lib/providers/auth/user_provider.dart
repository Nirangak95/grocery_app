import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../controllers/auth_controller.dart';
import '../../models/objects.dart';
import '../../screens/auth/signUp.dart';
import '../../screens/main/main_screen.dart';
import '../../utils/util_functions.dart';

class UserProvider extends ChangeNotifier {
  late UserModel _userModel;

  // ----- Get User model
  UserModel get userModel => _userModel;

  bool _isLoading = false;

  // -------- Get loading state
  bool get isLoading => _isLoading;

  // --------- Change Loading State
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //Fetch Single User Data
  Future<void> fetchUser(String id) async {
    try {
      setLoading(true);
      await AuthController().fetchUserData(id).then((value) {
        if (value != null) {
          Logger().i(value.email);

          _userModel = value;
          notifyListeners();
          setLoading(false);
        }
      });
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  // Check User already login or not
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().i('User is currently signed out!');
        UtilFunctions.navigateTo(context, const SignUp());
      } else {
        Logger().i('User is signed in!');
        await fetchUser(user.uid);
        UtilFunctions.navigateTo(context, MainScreen());
      }
    });
  }
}
