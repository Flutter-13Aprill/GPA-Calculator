import 'dart:math';

class CourseModel {
  CourseModel({required this.courseName, required this.creditHours, required this.grade});

  int id = Random().nextInt(99999);
  String courseName;
  String creditHours;
  String grade; 

  // Later on I will use this property to calculate the GPA
  double points = 0;

  
}