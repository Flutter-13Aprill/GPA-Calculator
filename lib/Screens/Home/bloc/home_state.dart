part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CourseAdded extends HomeState {}

final class CourseEdited extends HomeState {}

final class CourseDeleted extends HomeState {}

final class ShowAddCourseDialog extends HomeState {}

final class EditCourseDialogShown extends HomeState {
  final CourseModel course;
  final int index;

  EditCourseDialogShown({required this.course, required this.index});
}
