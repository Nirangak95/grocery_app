import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double h(BuildContext context) => MediaQuery.of(context).size.height;

  static double w(BuildContext context) => MediaQuery.of(context).size.width;
}
