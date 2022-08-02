import 'package:flutter/material.dart';
import 'package:national_id_extractor_app/constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primary,
    scaffoldBackgroundColor: bgLight,
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    appBarTheme: AppBarTheme(backgroundColor: primary),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: swatch,
      accentColor: secondary,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryDark,
    scaffoldBackgroundColor: bgDark,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: primaryDark),
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: swatch,
      accentColor: secondary,
      brightness: Brightness.dark,
      primaryColorDark: primaryDark,
    ),
  );
}