import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/collections/grades_map.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Map<String, dynamic>> courses = [];

  final formKey = GlobalKey<FormState>();
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController subjectHoursController = TextEditingController();
  TextEditingController subjectGradeController = TextEditingController();

  // GPA from 5.0 and start as 0.
  double gpa = 0;

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});

    on<AddItemEvent>(addCourse);

    on<EditItemEvent>((event, emit) {
      emit(SuccefullState());
    });

    on<DisplayGpaEvent>(CalculateGPA);

    on<RemoveItemEvent>((event, emit) {
      emit(SuccefullState());
    });

  }

  FutureOr<void> addCourse(AddItemEvent event, Emitter<HomeState> emit) {
    /// "controller.text" to access the data in the controllers as string.

    // print(GradesMap().getGradesMap());
    courses.add({
      "course": subjectNameController.text,
      "hours": int.parse(subjectHoursController.text),
      "grade": subjectGradeController.text,

      // * (The grade from the drop down meun)
    });
    emit(SuccefullState());
    print(courses);
  }

  FutureOr<void> CalculateGPA(DisplayGpaEvent event, Emitter<HomeState> emit) {
    double cumalitiveScore = 0;
    num totalHours = 0;

    //This is a loop for the hours
    for (var element in courses) {
      totalHours = totalHours + element["hours"];
      print("Total hours: $totalHours");
      cumalitiveScore =
          cumalitiveScore +
          (GradesMap().getGradeScore(element["grade"]) * element["hours"]);
    }
    gpa = cumalitiveScore / totalHours;
    print(gpa);
    emit(SuccefullCalcualteGpaState());
  }

  FutureOr<void> removeCourse(RemoveItemEvent event, Emitter<HomeState> emit) {
    emit(SuccefullState());
  }
}







  // Mr.Fahad Method
  // FutureOr<void> addNew(AddContainerEvent event, Emitter<HomeState> emit) {
  //   grades.add(Container(width: 50, height: 50, color: Colors.red));
  //   print(grades.length);
  //   emit(AddContainerState());
  // }
