part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class NameChangedEvent extends CourseEvent {
  final String name;

  NameChangedEvent(this.name);
}

class NameSubmitEvent extends CourseEvent {}

class HoursChangedEvent extends CourseEvent {
  final String hours;

  HoursChangedEvent(this.hours);
}

class GradeChangedEvent extends CourseEvent {
  final String grade;

  GradeChangedEvent(this.grade);
}

class DeleteCourseEvent extends CourseEvent {
  final int index;
  DeleteCourseEvent(this.index);
}

class EditCourseEvent extends CourseEvent {
  final int index;

  EditCourseEvent(this.index);
}
