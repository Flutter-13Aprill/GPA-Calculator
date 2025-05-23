part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class AddNewCourse extends CourseEvent {
  final CourseModel course;
  AddNewCourse({required this.course});
}

class DeleteCourse extends CourseEvent {
  final int courseIndex;
  DeleteCourse({required this.courseIndex});
}

class EditCourse extends CourseEvent {
  final CourseModel course;
  final int courseIndex;

  EditCourse({required this.course,required this.courseIndex});
}
