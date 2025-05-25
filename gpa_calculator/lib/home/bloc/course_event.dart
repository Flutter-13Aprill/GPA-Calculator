part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class AddCourseEvent extends CourseEvent {
  final CourseModel course;
  AddCourseEvent({required this.course});
}

class DropdownEvent extends CourseEvent {
  final String value;
  DropdownEvent({required this.value});
}

class DeleteCourseEvent extends CourseEvent {
  final CourseModel course;
  DeleteCourseEvent({required this.course});
}

class EditCourseEvent extends CourseEvent {
  final CourseModel oldCourse;
  final CourseModel updatedCourse;
  EditCourseEvent({required this.oldCourse, required this.updatedCourse});
}
