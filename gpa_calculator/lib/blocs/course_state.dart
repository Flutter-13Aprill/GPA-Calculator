import '../models/course_model.dart';

class CourseState {
  //courses: a list of Course, representing all added courses.
  final List<Course> courses;
  final double gpa;

 //Used to create a new state by passing values for the course list and GPA.
  CourseState({required this.courses, required this.gpa});

  //Creating the initial state of the application
  factory CourseState.initial() => CourseState(courses: [], gpa: 0.0);

 //copyWith: Creating a new copy of the state
  CourseState copyWith({List<Course>? courses, double? gpa}) {
    return CourseState(
      courses: courses ?? this.courses,
      gpa: gpa ?? this.gpa,
    );
  }
}
