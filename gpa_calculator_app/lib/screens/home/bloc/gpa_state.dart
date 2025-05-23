part of 'gpa_bloc.dart';

// Defines the various immutable states for the GPA BLoC

@immutable
sealed class GpaState {}

final class TodoInitial extends GpaState {}

final class SuccessState extends GpaState {
  final List<GpaCalculatorModel> grades;
  final double totalHourse;
  final double totalGrades;
  final double gpa;
  final double? selected;

  SuccessState({
    required this.grades,
    required this.totalHourse,
    required this.totalGrades,
    required this.gpa,
    required this.selected,
  });
}

final class ErrorState extends GpaState {}

final class LoadingState extends GpaState {}
