import 'package:flutter/material.dart';

abstract class IColorTheme {
  AppColors get colors;
  Color? backgroundColor;
  Color? appBarColor;
  Color? floatingButtonColor;
  Brightness? brightness;
  ColorScheme? colorScheme;
  Color? textfield;
  Color? colorRed;
}

class AppColors {
  final riceVine = const Color(0xffF5E8C7);
  final appleBlossom = const Color(0xffDEBA9D);
  final neapolitan = const Color(0xff9E7777);
  final prussianPlum = const Color(0xff6F4C5B);
  final black = const Color(0xff000000);
  final lightRed = const Color(0xffD45555);
  final red = const Color.fromARGB(255, 255, 0, 0);
  final scaffoldColor = const Color(0xffFDFDFD);
  final darkScaffoldColor = const Color(0xff19191B);
  final darkThemeTextColor = const Color(0xffFFFFFF);
  final lightThemeTextColor = const Color(0xff19191B);
  final headline6Color = const Color(0xff9D9D9D);
  final textfieldColor = const Color(0xfff4f2f4);
}
