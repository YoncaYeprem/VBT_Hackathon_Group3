import 'package:flutter/material.dart';

abstract class IColorTheme{
  AppColors get colors;
  Color? backgroundColor;
  Color? appBarColor;
  Color? floatingButtonColor;
  Brightness? brightness;
  ColorScheme? colorScheme;
}

class AppColors{
  final riceVine = const Color(0xffF5E8C7);
  final appleBlossom = const Color(0xffDEBA9D);
  final neapolitan =const Color(0xff9E7777);
  final prussianPlum = const Color(0xff6F4C5B);
  final black =  const Color(000000);
}