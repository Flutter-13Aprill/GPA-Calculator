import 'package:gpa_calculator/models/course_model.dart';

class CourseState {
  final List<Course> courses;

  // Constructor requiring a list of courses
  CourseState({required this.courses});

  // Calculate GPA based on courses
  double get gpa {
    if (courses.isEmpty) return 0.0;

    double totalPoints = 0;
    int totalCredits = 0;

    // Sum weighted grade points and total credits
    for (var course in courses) {
      totalPoints += course.gradePoint * course.credit;
      totalCredits += course.credit;
    }

    // Avoid division by zero
    return totalCredits == 0 ? 0.0 : totalPoints / totalCredits;
  }
}
