import 'package:flutter/material.dart';

abstract class ITextTheme{
  String? fontFamily;
  TextStyle? headline2;
  TextStyle? headline4;
  TextStyle? headline6;
  TextStyle? body1;
  final Color? primaryColor;

  ITextTheme(this.primaryColor);
}