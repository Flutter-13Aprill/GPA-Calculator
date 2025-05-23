import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gpa/models/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  List<CourseModel> courses = [
    CourseModel(name: "الرياضيات", grade: 95, creditHours: 4),
    CourseModel(name: "فيزياء", grade: 80, creditHours: 3),
    CourseModel(name: "برمجة", grade: 90, creditHours: 3),
    CourseModel(name: "مقدمة حاسوب	", grade: 80, creditHours: 2),
  ];
  late double totalPoint = courses.fold(
    0,
    (total, course) => course.point + total,
  );
  late int totalHour = courses.fold(
    0,
    (total, course) => course.creditHours + total,
  );
  late double gpa = totalPoint / totalHour;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final SingleValueDropDownController gradeController =
      SingleValueDropDownController();
  final TextEditingController hourController = TextEditingController();
  CourseBloc() : super(CourseInitial()) {
    on<CourseEvent>((event, emit) {});
    on<AddNewCourse>(addCourse);
    on<DeleteCourse>(deleteCourse);
    on<EditCourse>(updateCourse);
  }
  FutureOr<void> updateCourse(EditCourse event, Emitter<CourseState> emit) {
    courses[event.courseIndex]=event.course;
    emit(AddCourseSuccessful());
  }

  FutureOr<void> deleteCourse(DeleteCourse event, Emitter<CourseState> emit) {
    courses.remove(courses[event.courseIndex]);
    emit(DeleteCourseSuccessful());
  }

  FutureOr<void> addCourse(AddNewCourse event, Emitter<CourseState> emit) {
    courses.add(event.course);
    emit(AddCourseSuccessful());
  }
}
