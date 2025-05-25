import 'package:gpa_calc/bloc/home/data/gpa_model.dart';

abstract class HomeEvent {}

class UpdateName extends HomeEvent {
  final String name;
  UpdateName(this.name);
}

class UpdateHours extends HomeEvent {
  final String hours;
  UpdateHours(this.hours);
}

class UpdateGrade extends HomeEvent {
  final String grade;
  UpdateGrade(this.grade);
}

class AddCourse extends HomeEvent {
  final GpaModel course;
  AddCourse(this.course);
}

class EditCourse extends HomeEvent {
  final int index;
  final GpaModel updatedCourse;
  EditCourse({required this.index, required this.updatedCourse});
}

class DeleteCourse extends HomeEvent {
  final int index;
  DeleteCourse(this.index);
}

class ResetForm extends HomeEvent {}
