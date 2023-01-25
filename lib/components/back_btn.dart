import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_constants.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: SvgPicture.asset(AssetConstants.backBtnIcon));
  }
}
