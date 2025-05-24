part of 'gpa_bloc.dart';

@immutable
class GpaState {
  final List<Course> courses;

  const GpaState({
    this.courses = const [],
  }); //If we send a course list, it will be empty ([]) by default.

  double get gpa {
    if (courses.isEmpty) {
      //If there is no substance in it, we return 0.0 immediately.
      return 0.0;
    }

    double totalPoints = 0.0;
    int totalHours = 0;

    for (Course course in courses) {
      //We calculate points for this course
      double gradeValue = _gradeToPoint(course.grade);
      int hours = course.creditHours;
      double coursePoints = gradeValue * hours;

      totalPoints += coursePoints;
      totalHours += hours;
    }
    //We calculate the final average
    if (totalHours == 0) {
      return 0.0;
    } else {
      return totalPoints / totalHours;
    }
  }

  double _gradeToPoint(String grade) {
    //Convert degree to number
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B+':
        return 3.5;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.5;
      case 'C':
        return 2.0;
      case 'D+':
        return 1.5;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  GpaState copyWith({List<Course>? courses}) {
    return GpaState(courses: courses ?? this.courses);
  }
}
