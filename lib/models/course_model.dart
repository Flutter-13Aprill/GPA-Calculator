import 'dart:math';

class CourseModel {
  CourseModel({required this.courseName, required this.creditHours, required this.grade});

  int id = Random().nextInt(99999);
  String courseName;
  String creditHours;
  String grade; 

  // Later on I will use this property to calculate the GPA
  double points = 0;

  // It used to to convert grade into points
  static double getGradePoint(CourseModel course) {
    switch (course.grade) {
      case 'A+':
        return 4;

      case 'A':
        return 3.75;

      case 'B+':
        return 3.5;

      case 'B':
        return 3;

      case 'C+':
        return 2.5;

      case 'C':
        return 2;

      case 'D+':
        return 1.5;

      case 'D':
        return 1;

      default:
        return 0;
    }
  }

  
}