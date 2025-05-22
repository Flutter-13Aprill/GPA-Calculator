import 'package:flutter/material.dart';
import 'package:gpa_calculator/theming/app_colors.dart';

class AppFonts {
  static final appTheming = ThemeData(
    textTheme: TextTheme(

      titleLarge: TextStyle(
        // color: Color(0xffFC887B),
        color: AppColors.appBarTitleColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: TextStyle(
        fontSize: 22, 
        fontWeight: FontWeight.bold,
      ),

      bodySmall: TextStyle(
        fontSize: 16
      )
    ),
  );
}
