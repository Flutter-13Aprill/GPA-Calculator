import 'package:gpa_calculator/models/gpa_model.dart';

sealed class GpaEvent {}

class CreateNewTask extends GpaEvent {
  final GpaModel course;
  CreateNewTask({required this.course});
}

class SelectedGrade extends GpaEvent {
  final String? grade;
  SelectedGrade({required this.grade});
}
