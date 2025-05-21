import 'dart:async';

import 'package:app/models/courses_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'courses_event.dart';
part 'courses_state.dart';

/// BLoC class responsible for managing course-related states and events.
class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  /// A list to store all the courses.
  List<CoursesModel> coursess = [];

  /// Constructor for CoursesBloc
  // Initializes the BLoC with [CoursesInitial] state and registers event handlers.
  CoursesBloc() : super(CoursesInitial()) {
    /// Initializes the BLoC with [CoursesInitial] state and registers event handlers.
    on<CoursesEvent>(
      (event, emit) {},
    ); // Registers the handler for [CreatNewcourse] event.
    on<CreatNewcourse>(
      creatMethod,
    ); // Registers the handler for [CreatNewcourse] event.
    on<DeleteCourse>(
      deleteMethod,
    ); // Registers the handler for [DeleteCourse] event.
    on<EditCourse>(
      editingMethod,
    ); // Registers the handler for [EditCourse] event.
  }

  /// Handles the CreatNewcourseس event.
  /// Adds a new course to the [coursess] list and emits a [SucssesAddState].
  FutureOr<void> creatMethod(CreatNewcourse event, Emitter<CoursesState> emit) {
    coursess.add(event.courses);
    emit(SucssesAddState(coursess: coursess));
  }

  /// Handles the  DeleteCourse  event.
  /// Removes a course from the coursess list based on its ID and emits a SucssesAddState.
  FutureOr<void> deleteMethod(DeleteCourse event, Emitter<CoursesState> emit) {
    coursess.removeWhere((course) => course.id == event.courseId);
    emit(SucssesAddState(coursess: coursess));
  }

  /// Handles the EditCourse event.
  /// Finds the course by its ID and updates its details, then emits a SucssesAddState.

  FutureOr<void> editingMethod(EditCourse event, Emitter<CoursesState> emit) {
    // Iterate through the list to find the course to edit.
    for (var i = 0; i < coursess.length; i++) {
      if (coursess[i].id == event.courseId) {
        coursess[i] = CoursesModel(
          // Update the course details with the new values.
          id: event.courseId,
          coursesname: event.newCourseName,
          grade: event.newGrade,
          crediHhours: event.newCreditHours,
        );
        break; // Update the course details with the new values.
      }
    }
    // Emit a new state with the updated list of courses.
    emit(SucssesAddState(coursess: List.from(coursess)));
  }
}
