import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff004643); // #2
  static Color secondaryColor = const Color(0xff004643).withOpacity(0.7);
  static Color primeryTextColor = const Color(0xffEEEFF2); // #
  static double fontSiseBase = 18.0;
  static FontWeight fontWeight = FontWeight.w500;
  static Color yellow = const Color(0xffF8C660);
  static FontWeight semiBold = FontWeight.w600;

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: secondaryColor,
    );
  }

  static TextStyle textStyle(
      {Color? color, double? fontSize, FontWeight? fontWeight_}) {
    color ?? (color = primeryTextColor);
    fontSize ?? (fontSize = fontSiseBase);
    fontWeight_ ?? (fontWeight_ = fontWeight);
    return GoogleFonts.baloo2(
        color: color, fontSize: fontSize, fontWeight: fontWeight_);
  }
}
