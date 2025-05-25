part of 'course_bloc.dart';

@immutable
class CourseState {}

final class CourseInitial extends CourseState {}

final class NameChangeState extends CourseState {
  final String name;
  final String hours;
  final String grade;
  final bool isValid;
  final List<CourseModel> courses;

  NameChangeState(
    this.name,
    this.hours,
    this.grade,
    this.isValid,
    this.courses,
  );
}
