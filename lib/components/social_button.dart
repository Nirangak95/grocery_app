import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/assets_constants.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.iconPath, required this.onTap})
      : super(key: key);

  final String iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 34),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 5,
                color: AppColors.kAsh.withOpacity(.2))
          ],
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
