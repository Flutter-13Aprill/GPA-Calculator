import '../models/course_model.dart';

abstract class CourseEvent {}

//AddCourse: to add a course.
class AddCourse extends CourseEvent {
  final Course course;
  AddCourse(this.course);
}

//RemoveCourse: to remove a course.
class RemoveCourse extends CourseEvent {
  final int index;
  RemoveCourse(this.index);
}
//EditCourse: to Edit a course.
class EditCourse extends CourseEvent {
  final int index;
  final Course newCourse;
  EditCourse({required this.index, required this.newCourse});
}
