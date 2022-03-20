import 'package:flutter/material.dart';

import 'color/dark_color_theme.dart';
import 'color/i_color_theme.dart';
import 'color/light_color_theme.dart';
import 'text/dark_text_theme.dart';
import 'text/i_text_theme.dart';
import 'text/light_text_theme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColorTheme get colorTheme;
}

class AppThemeLight extends ITheme {
  @override
  IColorTheme get colorTheme => LightColorTheme();

  @override
  ITextTheme get textTheme => LightTextTheme();
}

class AppThemeDark extends ITheme {
  @override
  IColorTheme get colorTheme => DarkColorTheme();

  @override
  ITextTheme get textTheme =>
      DarkTextTheme(colorTheme.colors.darkThemeTextColor);
}

abstract class ThemeManager {
  static ThemeData createThemeData(ITheme theme) {
    return ThemeData(
      fontFamily: theme.textTheme.fontFamily,
      scaffoldBackgroundColor: theme.colorTheme.backgroundColor,
      textTheme: TextTheme(
        headline2: theme.textTheme.headline2,
        headline4: theme.textTheme.headline4,
        headline6: theme.textTheme.headline6,
        bodyText1: theme.textTheme.body1,
        button: theme.textTheme.button,
      ),
      appBarTheme: AppBarTheme(color: theme.colorTheme.appBarColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: theme.colorTheme.floatingButtonColor),
      colorScheme: theme.colorTheme.colorScheme,
    );
  }
}
