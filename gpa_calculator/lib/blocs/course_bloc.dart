import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/course_model.dart';
import 'course_event.dart';
import 'course_state.dart';

//Manages the logic of (event and state).
class CourseBloc extends Bloc<CourseEvent, CourseState> {

//CourseState.initial(), which assumes:
//An empty list of courses.
//A GPA of 0.0.

  CourseBloc() : super(CourseState.initial()) {
    on<AddCourse>((event, emit) {
      final updatedCourses = List<Course>.from(state.courses)..add(event.course);
      final gpa = _calculateGPA(updatedCourses);
      emit(state.copyWith(courses: updatedCourses, gpa: gpa));
    });

    // Here there are two objects that inherit from CourseEvent
    // (RemoveCourse, EditCourse)
    on<RemoveCourse>((event, emit) {
      final updatedCourses = List<Course>.from(state.courses)..removeAt(event.index);
      final gpa = _calculateGPA(updatedCourses);
      emit(state.copyWith(courses: updatedCourses, gpa: gpa));
    });

   //on: listens to the event
   //emit: updates/emits the event state
    on<EditCourse>((event, emit) {
      final updatedCourses = List<Course>.from(state.courses)
        ..[event.index] = event.newCourse;
      final gpa = _calculateGPA(updatedCourses);
      emit(state.copyWith(courses: updatedCourses, gpa: gpa));
    });
  }

  double _calculateGPA(List<Course> courses) {
    if (courses.isEmpty) return 0.0;

    double totalPoints = 0;
    int totalHours = 0;

    for (var course in courses) {
      totalPoints += course.gradeValue * course.creditHours;
      totalHours += course.creditHours;
    }

    return totalHours == 0 ? 0.0 : totalPoints / totalHours;
  }
}
