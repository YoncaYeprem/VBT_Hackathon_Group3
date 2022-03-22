import 'package:flutter/material.dart';
import '../color/i_color_theme.dart';

abstract class ITextTheme {
  String? fontFamily;
  TextStyle? headline2;
  TextStyle? headline4;
  TextStyle? headline6;
  TextStyle? body1;
  final Color? primaryColor;
  TextStyle? button;

  AppColors get getAppColors;

  ITextTheme(this.primaryColor);
}