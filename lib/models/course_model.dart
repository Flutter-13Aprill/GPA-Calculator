class CourseModel {
  CourseModel({required this.courseName, required this.creditHours, required this.grade});

  String courseName;
  String creditHours;
  String grade; 

  // Later on I will use this property to calculate the GPA
  double points = 0;
}