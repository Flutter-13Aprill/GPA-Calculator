import 'package:gpa_calc/bloc/home/data/gpa_model.dart';

class HomeState {
  final List<GpaModel> courses;
  final double gpa;
  final String name;
  final String hours;
  final String? selectedGrade;

  HomeState({
    this.courses = const [],
    this.gpa = 0.0,
    this.name = '',
    this.hours = '',
    this.selectedGrade,
  });

  HomeState copyWith({
    List<GpaModel>? courses,
    double? gpa,
    String? name,
    String? hours,
    String? selectedGrade,
  }) {
    return HomeState(
      courses: courses ?? this.courses,
      gpa: gpa ?? this.gpa,
      name: name ?? this.name,
      hours: hours ?? this.hours,
      selectedGrade: selectedGrade ?? this.selectedGrade,
    );
  }
}
