import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/models/course_model.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  // Initialize with empty course list
  CourseBloc() : super(CourseState(courses: [])) {
    
    // Handle adding a new course
    on<AddCourse>((event, emit) {
      final updated = List<Course>.from(state.courses)..add(event.course);
      emit(CourseState(courses: updated));
    });

    // Handle updating a course at given index
    on<UpdateCourse>((event, emit) {
      final updated = List<Course>.from(state.courses)
        ..[event.index] = event.course;
      emit(CourseState(courses: updated));
    });

    // Handle deleting a course at given index
    on<DeleteCourse>((event, emit) {
      final updated = List<Course>.from(state.courses)
        ..removeAt(event.index);
      emit(CourseState(courses: updated));
    });
  }
}
