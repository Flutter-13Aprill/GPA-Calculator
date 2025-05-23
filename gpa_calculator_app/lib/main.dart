import 'package:flutter/material.dart';
import 'package:gpa_calculator_app/screens/home/home_screen.dart';
import 'package:gpa_calculator_app/style/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.pinkLight),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
