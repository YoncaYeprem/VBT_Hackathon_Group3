import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'i_text_theme.dart';

class LightTextTheme implements ITextTheme {
  @override
  String? fontFamily;
  @override
  TextStyle? headline2;
  @override
  TextStyle? headline4;
  @override
  TextStyle? headline6;
  @override
  TextStyle? body1;

  @override
  Color? primaryColor;

  LightTextTheme(this.primaryColor) {
    fontFamily = GoogleFonts.lato().fontFamily;
    headline2 = TextStyle(fontSize: 65, fontWeight: FontWeight.w300);
    headline4 = TextStyle(fontSize: 30, fontWeight: FontWeight.w200);
    headline6 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
    body1 = TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  }
}
