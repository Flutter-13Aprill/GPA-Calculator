import 'dart:async';

import 'package:assignment10/models/subjects.dart';
import 'package:assignment10/widgets/simple.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'subjects_event.dart';
part 'subjects_state.dart';

class SubjectsBloc extends Bloc<SubjectsEvent, SubjectsState> {
  List<Simple> grade = [];
  String currentvalue = 'A+';
  double gradeValue = 0;
  double hoursValue = 0;
  double finalGrade = 0;
  double totalGrade = 0;

  SubjectsBloc() : super(SubjectsInitial()) {
    on<SelectedGrade>(changeDrop);
    on<CalculateEvent>(calcEvent);
  }

  FutureOr<void> changeDrop(SelectedGrade event, Emitter<SubjectsState> emit) {
    currentvalue = event.value;
    print('im here');
    emit(SuccessState());
  }

  FutureOr<void> calcEvent(CalculateEvent event, Emitter<SubjectsState> emit) {
    grade.add(event.simpleContainer);
    hoursValue += double.parse(event.simpleContainer.setHours.text);
    print(hoursValue);
    switch (event.simpleContainer.setGrade) {
      case 'A+':
        {
          gradeValue += 4;
        }
      case 'A':
        {
          gradeValue += 3.75;
        }
      case 'B+':
        {
          gradeValue += 3.5;
        }
      case 'B':
        {
          gradeValue += 3;
        }
      case 'C+':
        {
          gradeValue += 2.5;
        }
      case 'C':
        {
          gradeValue += 2;
        }
      case 'D+':
        {
          gradeValue += 1.5;
        }
      case 'D':
        {
          gradeValue += 1;
        }
      case 'F':
        {
          gradeValue += 0;
        }
    }
    print(gradeValue);

        totalGrade = gradeValue/hoursValue;

    emit(SuccessStateGrade(value: totalGrade));
  }
}
