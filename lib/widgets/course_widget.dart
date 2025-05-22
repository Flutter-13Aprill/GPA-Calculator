import 'package:flutter/material.dart';

// -- Model 
import 'package:gpa_calculator/models/course_model.dart';


class CourseWidget extends StatelessWidget {
  /// [CourseWidget] A widget that displays course details such as the course name, credit hours, and grade.
  const CourseWidget({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(course.courseName, style: Theme.of(context).textTheme.bodyMedium,),
      subtitle: Text('Credits: ${course.creditHours}', style: Theme.of(context).textTheme.bodySmall,),
      trailing: Text(course.grade, style: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}