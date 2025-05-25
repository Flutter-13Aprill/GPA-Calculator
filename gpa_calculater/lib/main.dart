import 'package:flutter/material.dart';
import 'package:gpa_calculater/screen/gpa_calculater_screen.dart';
import 'package:gpa_calculater/theem/theem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomeTheem.gpa,
      home: GpaCalculaterScreen(),
    );
  }
}
