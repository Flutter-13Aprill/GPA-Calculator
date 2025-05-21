//class CoursesModel for store values of Courses

class CoursesModel {
  // The name of the course, e.g., "Calculus I", "Data Structures".
  String coursesname;
  // The numerical grade received in the course, e.g., 3.5, 4.0.
  double grade;
  // The number of credit hours for the course, e.g., 3, 4.
  int crediHhours;
  // A unique identifier for the course.
  int id;
  // Constructor for the CoursesModel class.
  CoursesModel({
    required this.coursesname,
    required this.grade,
    required this.crediHhours,
    required this.id,
  });
}
