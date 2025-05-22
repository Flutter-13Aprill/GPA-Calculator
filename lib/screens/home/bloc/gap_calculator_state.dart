part of 'gap_calculator_bloc.dart';

@immutable
sealed class GapCalculatorState {}

final class GapCalculatorInitial extends GapCalculatorState {}

final class ShoeCoursesState extends GapCalculatorState{
  final List<CourseModel> courses;

  // To prevent the app from crashing
  double get gpa{
    if(courses.isEmpty){
      return 0;
    }
    
    // Calculating total grade points from all courses
    final totalPoints = courses.map((course) => getGradePoint(course) * double.parse(course.creditHours)).reduce((value, coursePoint) => value + coursePoint);

    // Getting all the hours from courses
    final totalHours = courses.map((course) => int.parse(course.creditHours)).reduce((value, courseHours) => value + courseHours);
    return totalPoints / totalHours;
  }

  ShoeCoursesState({required this.courses});
}
