class CourseModel {
  static int gpaScale = 5;
  final String name;
  final int grade;
  final int creditHours;
  late double point = ((grade / 100) * gpaScale).ceilToDouble()* creditHours;
  CourseModel({
    required this.name,
    required this.grade,
    required this.creditHours,
  });
}
