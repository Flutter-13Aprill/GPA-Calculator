import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gpabloc/Models/course_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<CourseModel> courses = [];
  double gpa = 0.0;
  double totalCredits = 0;
  double gpaOutof = 4.0;
  double totalGradePoints = 0.0;
  Map<String, double> gradePoints = {
    'A+': 4.0,
    'A': 4.0,
    'B+': 3.3,
    'B': 3.0,
    'C+': 2.3,
    'C': 2.0,
    'D+': 1.3,
    'D': 1.0,
    'F': 0.0,
  };
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseCreditsController = TextEditingController();
  TextEditingController editCourseNameController = TextEditingController();
  TextEditingController editCourseCreditsController = TextEditingController();
  String selectedGrade = 'A+';
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<AddCourseEvent>((event, emit) {
      final name = courseNameController.text.trim();
      final creditsText = courseCreditsController.text.trim();
      final credits = double.tryParse(creditsText);
      CourseModel course = CourseModel(
        courseName: name,
        courseCredits: credits!,
        courseGrade: selectedGrade,
      );
      courses.add(course);
      totalCredits += credits;
      totalGradePoints += gradePoints[selectedGrade]! * credits;
      gpa = totalGradePoints / totalCredits;
      emit(CourseAdded());
    });
    on<ShowAddCourseDialogEvent>((event, emit) {
      emit(ShowAddCourseDialog());
    });
    on<DeleteCourseEvent>((event, emit) {
      final index = event.index;
      totalCredits -= courses[index].courseCredits;
      totalGradePoints -=
          gradePoints[courses[index].courseGrade]! *
          courses[index].courseCredits;
      gpa = (totalGradePoints / totalCredits);
      gpa = gpa.isNaN ? 0.0 : gpa;
      courses.removeAt(index);
      emit(CourseDeleted());
    });
    on<EditCourseEvent>((event, emit) {
      final index = event.index;
      final name = editCourseNameController.text.trim();
      final creditsText = editCourseCreditsController.text.trim();
      final credits = double.tryParse(creditsText);
      CourseModel course = CourseModel(
        courseName: name,
        courseCredits: credits!,
        courseGrade: selectedGrade,
      );
      totalCredits -= courses[index].courseCredits;
      totalGradePoints -=
          gradePoints[courses[index].courseGrade]! *
          courses[index].courseCredits;
      courses[index] = course;
      totalCredits += credits;
      totalGradePoints += gradePoints[selectedGrade]! * credits;
      gpa = (totalGradePoints / totalCredits);
      gpa = gpa.isNaN ? 0.0 : gpa;
      emit(CourseEdited());
    });
    on<ShowEditCourseDialogEvent>((event, emit) {
      final course = event.course;
      final index = event.index;
      emit(EditCourseDialogShown(course: course, index: index));
    });
  }
}
