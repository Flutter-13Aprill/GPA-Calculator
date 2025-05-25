import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String CourseName;
  final String creditHours;
  final String grade;
  const CourseCard({
    super.key,
    required this.CourseName,
    required this.creditHours,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete, color: Colors.red),
        ),
        isThreeLine: true,
        title: Center(child: Text(CourseName)),
        subtitle: Column(
          children: [
            Text("CreditHours : $creditHours"),
            Text("Grade : $grade"),
          ],
        ),
      ),
    );
  }
}
