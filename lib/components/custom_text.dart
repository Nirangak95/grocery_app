import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.textAlign,
      this.fontSize = 15,
      this.fontWeight,
      this.color,
      this.textOverflow});

  final String text;
  final TextAlign? textAlign;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          fontSize: fontSize, color: color, fontWeight: fontWeight),
      overflow: textOverflow,
    );
  }
}
