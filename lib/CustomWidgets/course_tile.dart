import 'package:flutter/material.dart';
import 'package:gpabloc/Models/course_model.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Colors.lightGreen[200],
      title: Text(course.courseName, style: const TextStyle(fontSize: 12)),
      subtitle: Text(
        "Grade: ${course.courseGrade}",
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        "${course.courseCredits} Credits",
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
