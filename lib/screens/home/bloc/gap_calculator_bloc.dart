
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/models/course_model.dart';
import 'package:meta/meta.dart';

part 'gap_calculator_event.dart';
part 'gap_calculator_state.dart';

class GapCalculatorBloc extends Bloc<GapCalculatorEvent, GapCalculatorState> {

  List<CourseModel> courses = [];


  GapCalculatorBloc() : super(GapCalculatorInitial()) {
    on<GapCalculatorEvent>((event, emit) {
    });

    on<AddNewCourseEvent>(addNewCourse);

    on<EditCourseEvent>(editCourse);

    on<DeleteCourseEvent>(deleteCourse);

  }


  FutureOr<void> addNewCourse(AddNewCourseEvent event, Emitter<GapCalculatorState> emit) {
    final newCourse = event.course;
    courses.add(newCourse);
    emit(ShoeCoursesState(courses: courses));
  }

  FutureOr<void> editCourse(EditCourseEvent event, Emitter<GapCalculatorState> emit) {
    final index = event.index;
    final editedCourse = event.course;

    courses[index] = editedCourse;
    
    emit(ShoeCoursesState(courses: courses));
  }

  FutureOr<void> deleteCourse(DeleteCourseEvent event, Emitter<GapCalculatorState> emit) {

    final index = event.index;
    courses.removeAt(index);

    if(courses.isEmpty){
      emit(GapCalculatorInitial());
    }else{
      emit(ShoeCoursesState(courses: courses));
    }
  }
}




double getGradePoint(CourseModel course) {
  switch (course.grade) {
    case 'A+':
      return 4;

    case 'A':
      return 3.75;

    case 'B+':
      return 3.5;

    case 'B':
      return 3;

    case 'C+':
      return 2.5;

    case 'C':
      return 2;

    case 'D+':
      return 1.5;

    case 'D':
      return 1;

    default:
      return 0;
  }
}
