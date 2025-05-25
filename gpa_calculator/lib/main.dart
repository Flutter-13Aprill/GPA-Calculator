import 'package:flutter/material.dart';
import 'package:gpa_calculator/home/home_screen.dart';
import 'package:gpa_calculator/style/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defaultTheme,
      home: const HomeScreen(),
    );
  }
}
