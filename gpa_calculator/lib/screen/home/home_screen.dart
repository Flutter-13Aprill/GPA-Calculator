import 'package:flutter/material.dart';
import 'package:gpa_calculator/widget/course_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Column(children: [CourseWidget()])),
      ),
    );
  }
}
