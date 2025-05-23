part of 'gpa_bloc.dart';

// Defines the different events that trigger state changes in the GPA BLoC

@immutable
sealed class GpaEvent {}

class AddNewSubject extends GpaEvent {
  final GpaCalculatorModel grade;
  AddNewSubject({required this.grade});
}

class GradeSelected extends GpaEvent {
  final double selected;
  GradeSelected({required this.selected});
}

class EditSubject extends GpaEvent {
  final int index;
  final GpaCalculatorModel updatedSubject;

  EditSubject({required this.index, required this.updatedSubject});
}

class DeleteSubject extends GpaEvent {
  final int index;
  DeleteSubject({required this.index});
}
