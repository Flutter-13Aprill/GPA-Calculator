part of 'subjects_bloc.dart';

@immutable
sealed class SubjectsEvent {}

final class SelectedGrade extends SubjectsEvent {
  final String value;

  SelectedGrade(this.value);
}

final class UpdateTotalEvent extends SubjectsEvent {
  final double total;

  UpdateTotalEvent({required this.total});
}

final class CalculateEvent extends SubjectsEvent {
  // final String grade;
  // final TextEditingController hours;
  // final TextEditingController subjectName;
  final Simple simpleContainer;
  CalculateEvent({
    // required this.grade,
    // required this.hours,
    // required this.subjectName,
    required this.simpleContainer
  });
}
