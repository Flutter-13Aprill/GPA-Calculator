import 'package:flutter/material.dart';
import 'package:gpa_calculator/style/style_color.dart';

class CustomTheme {
  static final defaultTheme = ThemeData(
    scaffoldBackgroundColor: StyleColor.brown,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: StyleColor.green,
      onPrimary: Colors.black,
      secondary: StyleColor.blue,
      onSecondary: Colors.black,
      error: StyleColor.red,
      onError: Colors.black,
      surface: StyleColor.white,
      onSurface: Colors.black,
    ),
  );
}
