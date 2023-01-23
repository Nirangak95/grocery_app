import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/alert_helper.dart';

class SignUpProvider extends ChangeNotifier {
  // --------- Email Controller
  final _emailController = TextEditingController();

  // --------- Get Email Controller
  TextEditingController get emailController => _emailController;

  final _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  bool _isLoading = false;

  // -------- Get loading state
  bool get isLoading => _isLoading;

  // --------- Change Loading State
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

//Validate TextFields
  bool validateFields(BuildContext context) {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _nameController.text.isEmpty) {
      AlertHelper.showAlert(
          context, DialogType.error, "ËRROR", "Please fill all the fields !");
      return false;
    } else if (!_emailController.text.contains("@")) {
      AlertHelper.showAlert(
          context, DialogType.error, "ËRROR", "Please enter a valid email");
      return false;
    } else if (_passwordController.text.length < 6) {
      AlertHelper.showAlert(context, DialogType.error, "ËRROR",
          "Password must have more than 6 digits !");
      return false;
    } else {
      return true;
    }
  }

  // --------- Start Sign up process
  Future<void> startSignUp(BuildContext context) async {
    try {
      if (validateFields(context)) {
        //Start the loader
        setLoading(true);
        await AuthController().registerUser(
          context,
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );
        Logger().i("Success");

        _emailController.clear();
        _passwordController.clear();
        _nameController.clear();

        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      Logger().e(e);
      AlertHelper.showAlert(context, DialogType.error, "ËRROR", e.toString());
    }
  }
}
