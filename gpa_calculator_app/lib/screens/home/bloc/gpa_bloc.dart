import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calculator_app/models/gpa%D9%80calculator_model.dart';
import 'package:meta/meta.dart';

part 'gpa_event.dart';
part 'gpa_state.dart';

// GpaBloc manages GPA calculation logic and state updates; it handles adding, editing, deleting subjects, and selecting grades
// while calculating the cumulative GPA and emitting corresponding states.

class GpaBloc extends Bloc<GpaEvent, GpaState> {
  List<GpaCalculatorModel> grades = [];
  double totalWeightedGrades = 0;
  double? selected;

  final Map<String, double> gradesMap = {
    'A+': 5,
    'A': 4.75,
    'B+': 4.5,
    'B': 4,
    'C+': 3.5,
    'C': 3,
    'D+': 2.5,
    'D': 2,
    'F': 1,
  };

  final Map<double, String> gradeLetters = {
    5.0: 'A+',
    4.75: 'A',
    4.5: 'B+',
    4.0: 'B',
    3.5: 'C+',
    3.0: 'C',
    2.5: 'D+',
    2.0: 'D',
    1.0: 'F',
  };

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();

  GpaBloc() : super(TodoInitial()) {
    on<AddNewSubject>((event, emit) {
      grades.add(event.grade);
      _updateAndEmit(emit);
    });

    on<DeleteSubject>((event, emit) {
      grades.removeAt(event.index);
      _updateAndEmit(emit);
    });

    on<EditSubject>((event, emit) {
      grades[event.index] = event.updatedSubject;
      _updateAndEmit(emit);
    });

    on<GradeSelected>((event, emit) {
      selected = event.selected;
      _updateAndEmit(emit);
    });
  }

  double calculateGpa(double totalHours) {
    return totalWeightedGrades / totalHours;
  }

  void _updateAndEmit(Emitter<GpaState> emit) {
    totalWeightedGrades = grades.fold(
      0.0,
      (sum, item) => sum + (item.subjectHours * item.subjectGrade),
    );

    final double totalHours = grades.fold(
      0.0,
      (sum, item) => sum + item.subjectHours,
    );
    final double totalGrades = grades.fold(
      0.0,
      (sum, item) => sum + item.subjectGrade,
    );
    final double gpa = totalHours == 0 ? 0 : calculateGpa(totalHours);

    emit(
      SuccessState(
        grades: grades,
        totalHourse: totalHours,
        totalGrades: totalGrades,
        gpa: gpa,
        selected: selected,
      ),
    );
  }
}
