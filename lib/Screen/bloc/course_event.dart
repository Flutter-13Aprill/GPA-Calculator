import 'package:gpa_calculator/models/course_model.dart';

// Base class for all course events
abstract class CourseEvent {}

// Event to add a new course
class AddCourse extends CourseEvent {
  final Course course;
  AddCourse(this.course);
}

// Event to update an existing course by index
class UpdateCourse extends CourseEvent {
  final int index;
  final Course course;
  UpdateCourse(this.index, this.course);
}

// Event to delete a course by index
class DeleteCourse extends CourseEvent {
  final int index;
  DeleteCourse(this.index);
}
