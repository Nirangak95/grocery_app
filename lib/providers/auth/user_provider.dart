import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/providers/order/order_provider.dart';
import 'package:grocery_app/providers/product/product_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

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

        //Fetch Product list
        Provider.of<ProductProvider>(context, listen: false).fetchProducts();

        //Fetch Order list
        Provider.of<OrderProvider>(context, listen: false)
            .fetchOrders(user.uid);

        UtilFunctions.navigateTo(context, MainScreen());
      }
    });
  }

  // ----------- Image Picker instance
  final ImagePicker _picker = ImagePicker();

  File _image = File("");

  //Getter for image
  File get getImage => _image;

  //----- a function to pic a file from gallery
  Future<void> selectImageAndUpload() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      // check if the user image selected or not
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        //---- Start uploading the image after picking
        await updateProfileImage(_image);
        notifyListeners();
      } else {
        Logger().e("No Image selected");
      }
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  //Upload and update profile image
  Future<void> updateProfileImage(File image) async {
    try {
      setLoading(true);

      //Start Uploading the image
      String imgUrl = await AuthController()
          .uploadAndUpdateProfileImage(_userModel.uid, image);

      if (imgUrl != "") {
        // update the user model img field with returned the download URL
        _userModel.img = imgUrl;
        notifyListeners();
      }

      setLoading(false);
    } catch (e) {
      Logger().e(e);
      setLoading(false);
    }
  }
}
