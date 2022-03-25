import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/i_color_theme.dart';
import 'i_text_theme.dart';

class DarkTextTheme implements ITextTheme {
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
  TextStyle? body2;
  @override
  Color? primaryColor;
  @override
  AppColors getAppColors = AppColors();

  DarkTextTheme(this.primaryColor) {
    fontFamily = GoogleFonts.lato().fontFamily;
    headline2 = const TextStyle(fontSize: 65, fontWeight: FontWeight.w400);
    headline4 = const TextStyle(fontSize: 30, fontWeight: FontWeight.w300);
    headline6 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    body1 = const TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
    body2 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
    button = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  }

  @override
  TextStyle? button;
}
