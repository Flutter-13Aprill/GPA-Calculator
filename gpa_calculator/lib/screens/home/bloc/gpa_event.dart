part of 'gpa_bloc.dart';

@immutable
sealed class GpaEvent {}

class AddCourseEvent extends GpaEvent {
  final Course course;

  AddCourseEvent(this.course);
}

class DeleteCourseEvent extends GpaEvent {
  final String courseID;
  DeleteCourseEvent(this.courseID);
}

class UpdateCourseEvent extends GpaEvent {
  final Course updatedcourse;
  UpdateCourseEvent(this.updatedcourse);
}
