import 'package:flutter/material.dart';

import 'i_color_theme.dart';

class DarkColorTheme implements IColorTheme {
  @override
  late final Color? appBarColor;

  @override
  late final Color? backgroundColor;

  @override
  late final Brightness? brightness;

  @override
  late final ColorScheme? colorScheme;

  @override
  late final Color? floatingButtonColor;

  @override
  AppColors colors = AppColors();

  DarkColorTheme() {
    appBarColor = colors.black;
    backgroundColor = colors.darkScaffoldColor;
    floatingButtonColor = colors.neapolitan;
    brightness = Brightness.light;
    colorScheme = const ColorScheme.dark().copyWith(
      onPrimary: colors.black,
      onSurface: colors.appleBlossom,
      primary: colors.lightRed,
    );
  }
}
