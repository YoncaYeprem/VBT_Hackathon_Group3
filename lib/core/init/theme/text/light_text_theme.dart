import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vbt_hackathon_group3/core/init/theme/color/i_color_theme.dart';

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
  TextStyle? button;

  @override
  Color? primaryColor;
  @override
  AppColors getAppColors = AppColors();

  LightTextTheme() {
    fontFamily = GoogleFonts.lato().fontFamily;
    headline2 = const TextStyle(fontSize: 65, fontWeight: FontWeight.w300);
    headline4 = const TextStyle(fontSize: 30, fontWeight: FontWeight.w200);
    headline6 = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w100,
        color: getAppColors.headline6Color);
    body1 = const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
    button = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: getAppColors.riceVine,
    );
  }
}
