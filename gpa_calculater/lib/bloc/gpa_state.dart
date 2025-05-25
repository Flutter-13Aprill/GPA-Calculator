part of 'gpa_bloc.dart';

@immutable
sealed class GpaState {}

// final class GpaInitial extends GpaState {}

final class loodingState extends GpaState {}

final class addstate extends GpaState {
  final List<Taskmodel> tasks;
  final double calculateGPA;

  addstate({required this.tasks, required this.calculateGPA});
}

final class deletestate extends GpaState {
  final List<Taskmodel> tasks;
  final double calculateGPA;

  deletestate({required this.tasks, required this.calculateGPA});
}
