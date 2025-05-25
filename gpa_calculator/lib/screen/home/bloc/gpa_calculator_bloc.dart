import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gpa_calculator/model/course_model.dart';
import 'package:meta/meta.dart';

part 'gpa_calculator_event.dart';
part 'gpa_calculator_state.dart';

class GpaCalculatorBloc extends Bloc<GpaCalculatorEvent, GpaCalculatorState> {
  List<CourseModel> courses = [];
  List<String> grades = [];
  GpaCalculatorBloc() : super(GpaCalculatorInitial()) {
    on<CreateNewCourse>(createMethod);
  }

  FutureOr<void> createMethod(
    CreateNewCourse event,
    Emitter<GpaCalculatorState> emit,
  ) {
    courses.add(event.cours);
    grades.add(event.grade);
    double gpa = calculateGPA(grades);

    emit(SuccessState(courses: courses, grade: gpa));
  }
}

double calculateGPA(List<String> value) {
  final Map<String, double> gradeMap = {
    'A+': 4.0,
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D': 1.0,
    'F': 0.0,
  };

  double totalPoints = 0.0;

  for (var grade in value) {
    final gpa = gradeMap[grade.toUpperCase()];
    if (gpa != null) {
      totalPoints += gpa;
    }
  }

  if (value.isEmpty) return 0.0;

  return totalPoints / value.length;
}
