import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class AlertHelper {
  static Future<dynamic> showAlert(
    BuildContext context,
    DialogType dialogType,
    String title,
    String description,
  ) async {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  // --- Show snack bar function

  static void showSnackBar(
      String msg, AnimatedSnackBarType type, BuildContext context) {
    AnimatedSnackBar.material(
      msg,
      type: type,
      duration: const Duration(
        milliseconds: 500,
      ),
    ).show(context);
  }
}
