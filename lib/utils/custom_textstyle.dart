import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomTextStyles {
  // Define a base text style
  static  TextStyle baseTextStyle = GoogleFonts.inter(
  );

  // Custom text style with optional parameters
  static TextStyle customStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return baseTextStyle.copyWith(
      fontSize: fontSize ?? baseTextStyle.fontSize,
      fontWeight: fontWeight ?? baseTextStyle.fontWeight,
      color: color ?? baseTextStyle.color,
    );
  }
}