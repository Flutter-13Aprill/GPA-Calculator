import 'package:flutter/material.dart';

class AppColors {

  static final Color appBarTitleColor = Colors.white;
  static final appBarColor = LinearGradient(
    colors: [
      Color(0xffFBA483),
      Color(0xffF97878),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft
  );

  static final primaryColor = Color(0xffFC887B);
  static final Color secondaryColor = Colors.white;
}