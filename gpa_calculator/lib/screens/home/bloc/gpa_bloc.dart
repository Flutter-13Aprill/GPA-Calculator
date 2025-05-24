import 'package:bloc/bloc.dart';
import 'package:gpa_calculator/models/course_model.dart';

import 'package:meta/meta.dart';

part 'gpa_event.dart';
part 'gpa_state.dart';

class GpaBloc extends Bloc<GpaEvent, GpaState> {
  GpaBloc() : super(GpaState.initial()) {
    on<AddCourseEvent>(_onAddCourse);
    on<DeleteCourseEvent>(_onDeleteCourse);
    on<UpdateCourseEvent>(_onUpdateCourse);
  }

  void _onAddCourse(AddCourseEvent event, Emitter<GpaState> emit) {
    final updatedCourses = List<Course>.from(state.courses)..add(event.course);
    final updatedGpa = _calculateGpa(updatedCourses);
    emit(GpaState(courses: updatedCourses, gpa: updatedGpa));
  }

  void _onDeleteCourse(DeleteCourseEvent event, Emitter<GpaState> emit) {
    final updatedCourses =
        state.courses.where((c) => c.id != event.courseID).toList();
    final updatedGpa = _calculateGpa(updatedCourses);
    emit(GpaState(courses: updatedCourses, gpa: updatedGpa));
  }

  void _onUpdateCourse(UpdateCourseEvent event, Emitter<GpaState> emit) {
    final updatedCourses = state.courses.map((course) {
      return course.id == event.updatedcourse.id ? event.updatedcourse : course;
    }).toList();
    final updatedGpa = _calculateGpa(updatedCourses);
    emit(GpaState(courses: updatedCourses, gpa: updatedGpa));
  }

  double _calculateGpa(List<Course> courses) {
    final gradeMap = {
      "A+": 5.0,
      "A": 4.75,
      "B+": 4.5,
      "B": 4.0,
      "C+": 3.5,
      "C": 3.0,
      "D+": 2.5,
      "D": 2.0,
      "F": 1.0,
    };
    double totalPoints = 0;
    int totalCredits = 0;
    for (var course in courses) {
      final gradeValue = gradeMap[course.grade] ?? 0.0;
      totalPoints += gradeValue * course.creditHours;
      totalCredits += course.creditHours;
    }

    return totalCredits == 0 ? 0.0 : totalPoints / totalCredits;
  }
}
