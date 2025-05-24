part of 'add_course_bloc.dart';

@immutable
class AddCourseState {
  final String name;
  final String hours;
  final String? grade;

  const AddCourseState({
    required this.name,
    required this.hours,
    required this.grade,
  });

  bool get isValid =>
      name.isNotEmpty && int.tryParse(hours) != null && grade != null;

  AddCourseState copyWith({
    String? name,
    String? hours,
    String? grade,
  }) {
    return AddCourseState(
      name: name ?? this.name,
      hours: hours ?? this.hours,
      grade: grade ?? this.grade,
    );
  }

  factory AddCourseState.initial() {
    return const AddCourseState(name: '', hours: '', grade: null);
  }
}
