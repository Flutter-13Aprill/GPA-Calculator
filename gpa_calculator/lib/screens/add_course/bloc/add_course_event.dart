part of 'add_course_bloc.dart';

@immutable
sealed class AddCourseEvent {}

class CourseNameChanged extends AddCourseEvent {
  final String name;
  CourseNameChanged({required this.name});
}

class CourseHoursChanged extends AddCourseEvent {
  final String hours;
  CourseHoursChanged({required this.hours});
}

class CourseGradeChanged extends AddCourseEvent {
  final String grade;
  CourseGradeChanged({required this.grade});
}
