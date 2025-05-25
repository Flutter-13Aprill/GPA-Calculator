import 'package:flutter/material.dart';
import 'package:gpa_app/counter/counter_screen.dart';
import 'package:gpa_app/course/course_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: (CourseScreen()));
  }
}
