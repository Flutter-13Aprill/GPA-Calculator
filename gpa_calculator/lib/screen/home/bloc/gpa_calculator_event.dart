part of 'gpa_calculator_bloc.dart';

@immutable
sealed class GpaCalculatorEvent {}

class CreateNewCourse extends GpaCalculatorEvent {
  final CourseModel cours;
  final String grade;

  CreateNewCourse({required this.cours, required this.grade});
}
