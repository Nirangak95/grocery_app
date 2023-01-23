import 'package:flutter/material.dart';

class UtilFunctions {
  //Navigator function
  static void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
  }
}
