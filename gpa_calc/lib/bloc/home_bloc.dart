import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calc/bloc/home/data/gpa_model.dart';
import 'package:gpa_calc/bloc/home_event.dart';
import 'package:gpa_calc/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<UpdateName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<UpdateHours>((event, emit) {
      emit(state.copyWith(hours: event.hours));
    });

    on<UpdateGrade>((event, emit) {
      emit(state.copyWith(selectedGrade: event.grade));
    });

    on<AddCourse>((event, emit) {
      final updatedCourses = List<GpaModel>.from(state.courses)
        ..add(event.course);
      final gpa = _calculateGpa(updatedCourses);
      emit(state.copyWith(courses: updatedCourses, gpa: gpa));
    });

    on<EditCourse>((event, emit) {
      final updatedCourses = List<GpaModel>.from(state.courses);
      updatedCourses[event.index] = event.updatedCourse;
      final gpa = _calculateGpa(updatedCourses);
      emit(state.copyWith(courses: updatedCourses, gpa: gpa));
    });

    on<DeleteCourse>((event, emit) {
      final updatedCourses = List<GpaModel>.from(state.courses)
        ..removeAt(event.index);
      final gpa = _calculateGpa(updatedCourses);
      emit(state.copyWith(courses: updatedCourses, gpa: gpa));
    });

    on<ResetForm>((event, emit) {
      emit(state.copyWith(name: '', hours: '', selectedGrade: null));
    });
  }

  double _calculateGpa(List<GpaModel> courses) {
    if (courses.isEmpty) return 0.0;
    double totalPoints = 0.0;
    int totalHours = 0;

    for (var course in courses) {
      totalHours += course.hourse;
      totalPoints += course.hourse * _gradeToPoint(course.grade);
    }
    return totalHours == 0 ? 0 : totalPoints / totalHours;
  }

  double _gradeToPoint(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.0;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }
}
