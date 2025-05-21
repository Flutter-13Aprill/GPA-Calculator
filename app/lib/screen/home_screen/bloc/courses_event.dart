part of 'courses_bloc.dart';

@immutable
sealed class CoursesEvent {}

/// Event to create a new course.

class CreatNewcourse extends CoursesEvent {
  final CoursesModel courses;

  CreatNewcourse({required this.courses});
}
/// Event to cressssate a new course.

 class DeleteCourse extends CoursesEvent {
  final int courseId;//define an id
//Constructor  to initialize varibles
  DeleteCourse({required this.courseId});
}

/// Event to create a new course.

class EditCourse extends CoursesEvent {
  //define  attrbutes 
  final int courseId;
  final String newCourseName;
  final int newCreditHours;
  final double newGrade;

  EditCourse({
    required this.courseId,
    required this.newCourseName,
    required this.newCreditHours,
    required this.newGrade,
  });
}