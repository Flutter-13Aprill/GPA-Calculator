import 'package:flutter/material.dart';

// Screens
import 'package:gpa_calculator/screens/home/home_screen.dart';
// App Theming
import 'package:gpa_calculator/theming/app_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppFonts.appTheming,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}