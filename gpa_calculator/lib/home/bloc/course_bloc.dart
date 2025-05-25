import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/home/model/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

/// Bloc to manage courses and calculate GPA.
///
/// Supports adding, deleting, editing courses, and changing the selected grade.
/// Maintains a list of courses and calculates GPA based on grades and credit hours.
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final TextEditingController inputCourse = TextEditingController();
  final TextEditingController inputCredit = TextEditingController();
  String dropdownValue = 'A+';
  double gpa = 0;
  double totalGrade = 0;
  int totalHours = 0;
  final List<CourseModel> courseList = [];

  CourseBloc()
    : super(SuccessListState(courseList: [], selectedValue: '', gpa: 0)) {
    on<CourseEvent>((event, emit) {});
    on<AddCourseEvent>(addCourseMethod);
    on<DeleteCourseEvent>(deleteCourseMethod);
    on<EditCourseEvent>(editCourseMethod);
    on<DropdownEvent>(dropdownEventMethod);
  }

  FutureOr<void> addCourseMethod(
    AddCourseEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 1));
    courseList.add(event.course);
    _calculateGPA();
    emit(
      SuccessListState(
        courseList: courseList,
        selectedValue: dropdownValue,
        gpa: gpa,
      ),
    );
  }

  FutureOr<void> deleteCourseMethod(
    DeleteCourseEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 1));
    courseList.remove(event.course);
    _calculateGPA();
    emit(
      SuccessListState(
        courseList: courseList,
        selectedValue: dropdownValue,
        gpa: gpa,
      ),
    );
  }

  FutureOr<void> editCourseMethod(
    EditCourseEvent event,
    Emitter<CourseState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 1));

    final index = courseList.indexOf(event.oldCourse);
    if (index != -1) {
      courseList[index] = event.updatedCourse;
    }
    _calculateGPA();
    emit(
      SuccessListState(
        courseList: courseList,
        selectedValue: dropdownValue,
        gpa: gpa,
      ),
    );
  }

  FutureOr<void> dropdownEventMethod(
    DropdownEvent event,
    Emitter<CourseState> emit,
  ) {
    dropdownValue = event.value;
    emit(
      SuccessListState(
        courseList: courseList,
        selectedValue: dropdownValue,
        gpa: gpa,
      ),
    );
  }

  void _calculateGPA() {
    totalGrade = 0.0;
    totalHours = 0;
    double getGradePoint(String grade) {
      switch (grade) {
        case 'A+':
          return 5.0;
        case 'A':
          return 4.75;
        case 'B+':
          return 4.5;
        case 'B':
          return 4.0;
        case 'C+':
          return 3.5;
        case 'C':
          return 3.0;
        case 'D+':
          return 2.5;
        case 'D':
          return 2.0;
        case 'F':
          return 1.0;
        default:
          return 0.0;
      }
    }

    for (final course in courseList) {
      final grade = getGradePoint(course.grade);
      totalGrade += grade * course.houres;
      totalHours += course.houres;
    }

    gpa = totalHours > 0 ? totalGrade / totalHours : 0.0;
  }
}
