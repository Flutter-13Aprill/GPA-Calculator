part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class AddCourseEvent extends HomeEvent {}

final class EditCourseEvent extends HomeEvent {
  final CourseModel course;
  final int index;

  EditCourseEvent(this.course, this.index);
}

final class DeleteCourseEvent extends HomeEvent {
  final int index;

  DeleteCourseEvent(this.index);
}

final class ShowAddCourseDialogEvent extends HomeEvent {}

final class ShowEditCourseDialogEvent extends HomeEvent {
  final CourseModel course;
  final int index;

  ShowEditCourseDialogEvent({required this.course, required this.index});
}
