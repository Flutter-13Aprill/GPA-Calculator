part of 'gpa_bloc.dart';

@immutable
sealed class GpaEvent {}

class AddCourse extends GpaEvent { //If the user adds a new course from the AddEditCourseScreen screen
  final Course course;
  AddCourse(this.course);
}

class UpdateCourse extends GpaEvent {
  final int index;
  final Course updatedCourse;
  UpdateCourse(this.index, this.updatedCourse);
}

class DeleteCourse extends GpaEvent {
  final int index;
  DeleteCourse(this.index);
}
