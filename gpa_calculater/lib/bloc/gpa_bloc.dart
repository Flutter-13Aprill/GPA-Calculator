import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gpa_calculater/taskmodel.dart';
import 'package:meta/meta.dart';

part 'gpa_event.dart';
part 'gpa_state.dart';

class GpaBloc extends Bloc<GpaEvent, GpaState> {
  List<Taskmodel> Subjects = [];
  double sum = 0;
  double totalhours = 0;
  GpaBloc() : super(loodingState()) {
    on<addsubject>(createMethod);
    on<deletesubject>(deleteMetod);
    on<editsubject>(editMethod);
  }

  FutureOr<void> createMethod(addsubject event, Emitter<GpaState> emit) {
    Subjects.add(
      event.task,
    ); //store taskmoel in list name subject becuse the event change the value evry time the user press the buton calculate
    for (int i = 0; i < Subjects.length; i++) {
      int hours = int.tryParse(Subjects[i].hours) ?? 0;
      double gradeValue = 0;
      switch (Subjects[i].grade) {
        case "A+":
          gradeValue = 5.0;
          break;
        case "A":
          gradeValue = 4.75;
          break;
        case "B+":
          gradeValue = 4.5;
          break;
        case "B":
          gradeValue = 3.5;
          break;
        case "C+":
          gradeValue = 3.0;
          break;
        case "C":
          gradeValue = 3.0;
          break;
        case "D+":
          gradeValue = 2.5;
          break;
        case "D":
          gradeValue = 2.0;
          break;
        default:
          gradeValue = 0;
      }
      sum += hours * gradeValue;
      totalhours += hours;
    }
    double CalculateGPA = totalhours > 0 ? sum / totalhours : 0;
    emit(addstate(tasks: Subjects, calculateGPA: CalculateGPA));
  }

  FutureOr<void> deleteMetod(deletesubject event, Emitter<GpaState> emit) {
    Subjects.remove(event.task);
    double sum = 0;
    double totalhours = 0;
    for (int i = 0; i < Subjects.length; i++) {
      int hours = int.tryParse(Subjects[i].hours) ?? 0;
      double gradeValue = 0;
      switch (Subjects[i].grade) {
        case "A+":
          gradeValue = 5.0;
          break;
        case "A":
          gradeValue = 4.75;
          break;
        case "B+":
          gradeValue = 4.5;
          break;
        case "B":
          gradeValue = 3.5;
          break;
        case "C+":
          gradeValue = 3.0;
          break;
        case "C":
          gradeValue = 3.0;
          break;
        case "D+":
          gradeValue = 2.5;
          break;
        case "D":
          gradeValue = 2.0;
          break;
        default:
          gradeValue = 0;
      }
      sum += hours * gradeValue;
      totalhours += hours;
    }
    double CalculateGPA = totalhours > 0 ? sum / totalhours : 0;
    emit(deletestate(tasks: Subjects, calculateGPA: CalculateGPA));
  }

  FutureOr<void> editMethod(editsubject event, Emitter<GpaState> emit) {
    final index = Subjects.indexOf(event.oldtask);
    if (index != -1) {
      Subjects[index] = event.updatetask;
    }
    double sum = 0;
    double totalhours = 0;
    for (var subject in Subjects) {
      int hours = int.tryParse(subject.hours) ?? 0;
      double gradeValue;
      switch (subject.grade) {
        case "A+":
          gradeValue = 5.0;
          break;
        case "A":
          gradeValue = 4.75;
          break;
        case "B+":
          gradeValue = 4.5;
          break;
        case "B":
          gradeValue = 3.5;
          break;
        case "C+":
          gradeValue = 3.0;
          break;
        case "C":
          gradeValue = 3.0;
          break;
        case "D+":
          gradeValue = 2.5;
          break;
        case "D":
          gradeValue = 2.0;
          break;
        default:
          gradeValue = 0;
      }
      sum += hours * gradeValue;
      totalhours += hours;
    }
    double calculateGPA = totalhours > 0 ? sum / totalhours : 0;
    emit(addstate(tasks: Subjects, calculateGPA: calculateGPA));
  }
}
