import 'package:gpa_calculator/models/gpa_model.dart';

sealed class GpaState {}

final class GpaInitial extends GpaState {}

final class GpaSuccessState extends GpaState {
  final List<GpaModel> courses;
  final String? grades;

  GpaSuccessState({required this.courses, this.grades});
}

final class ErrorState extends GpaState {}
