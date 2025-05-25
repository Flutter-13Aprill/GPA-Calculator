import 'package:flutter/material.dart';
import 'package:gpa_calc/bloc/home/data/gpa_model.dart';

class CustomCard extends StatelessWidget {
  final GpaModel course;

  const CustomCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(course.name),
        subtitle: Text("Hours: ${course.hourse} - Grade: ${course.grade}"),
      ),
    );
  }
}
