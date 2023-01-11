import 'package:flutter/material.dart';

class PrimaryFont {
  static String fontFamily = 'DIN';

  static TextStyle din(double size, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: size,
    );
  }
}