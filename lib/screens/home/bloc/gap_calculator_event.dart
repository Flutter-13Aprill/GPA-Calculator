part of 'gap_calculator_bloc.dart';

@immutable
sealed class GapCalculatorEvent {}

class AddNewCourseEvent extends GapCalculatorEvent{
  final CourseModel course;
  AddNewCourseEvent({required this.course});
}

class EditCourseEvent extends GapCalculatorEvent{
  final int index;
  final CourseModel course; 

  EditCourseEvent({required this.course, required this.index});
}

class DeleteCourseEvent extends GapCalculatorEvent {
  final int index;
  DeleteCourseEvent({required this.index});
}

class CalculateGAPEvent extends GapCalculatorEvent{
  final List<CourseModel> courses;
  CalculateGAPEvent({required this.courses});
}