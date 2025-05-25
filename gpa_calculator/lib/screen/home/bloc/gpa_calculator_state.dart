part of 'gpa_calculator_bloc.dart';

@immutable
sealed class GpaCalculatorState {}

final class GpaCalculatorInitial extends GpaCalculatorState {}

final class SuccessState extends GpaCalculatorState {
  final List<CourseModel> courses;
  final double grade;

  SuccessState({required this.courses, required this.grade});
}
