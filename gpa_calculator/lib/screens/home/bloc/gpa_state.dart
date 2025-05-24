part of 'gpa_bloc.dart';

@immutable
class GpaState {
  final List<Course> courses;
  final double gpa;

  const GpaState({
    required this.courses,
    required this.gpa,
  });

  factory GpaState.initial() {
    return const GpaState(courses: [], gpa: 0.0);
  }
}
