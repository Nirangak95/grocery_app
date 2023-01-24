import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/alert_helper.dart';

class AdminProvider extends ChangeNotifier {
  final _proNameController = TextEditingController();

  TextEditingController get proNameController => _proNameController;

  final _descController = TextEditingController();

  TextEditingController get descController => _descController;

  final _priceController = TextEditingController();

  TextEditingController get priceController => _priceController;

  bool _isLoading = false;

  // -------- Get loading state
  bool get isLoading => _isLoading;

// ----------- Image Picker instance
  final ImagePicker _picker = ImagePicker();

  File _image = File("");

  //Getter for image
  File get getImage => _image;

  //----- a function to pic a file from gallery
  Future<void> selectImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      // check if the user image selected or not
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
      } else {
        Logger().e("No Image selected");
      }
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  // --------- Change Loading State
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> startSaveProductInfo(BuildContext context) async {
    try {
      //Start the loader
      setLoading(true);
      await AdminController().saveProductInfo(
        context,
        _proNameController.text,
        _descController.text,
        _priceController.text,
        _image,
      );
      Logger().i("Success");

      _proNameController.clear();
      _descController.clear();
      _priceController.clear();

      setLoading(false);

      AlertHelper.showAlert(context, DialogType.success, "Success",
          "Product info saved successfully");
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.toString());
    }
  }
}
