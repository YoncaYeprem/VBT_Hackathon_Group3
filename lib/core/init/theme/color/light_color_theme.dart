import 'package:flutter/material.dart';

import 'i_color_theme.dart';

class LightColorTheme implements IColorTheme {
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

  LightColorTheme() {
    appBarColor = colors.prussianPlum;
    backgroundColor = colors.neapolitan;
    floatingButtonColor = colors.riceVine;
    brightness = Brightness.light;
    colorScheme = const ColorScheme.light()
        .copyWith(onPrimary: colors.riceVine, onSurface: colors.prussianPlum);
  }
}