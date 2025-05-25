part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class SuccessListState extends CourseState {
  final List<CourseModel> courseList;
  final String selectedValue;
  final double gpa;
  SuccessListState({
    required this.courseList,
    required this.selectedValue,
    required this.gpa,
  });
}

final class ErrorState extends CourseState {}

final class LoadingState extends CourseState {}

final class ClearScreenState extends CourseState {}
