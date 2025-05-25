import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:gpa_app/model/coures_model.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final List<CourseModel> courses = [];
  int? editingIndex;
  // Grade to GPA value map
  final Map<String, double> gradeMap = {
    'A+': 4.0,
    'A': 4.0,
    'A-': 3.7,
    'B+': 3.3,
    'B': 3.0,
    'B-': 2.7,
    'C+': 2.3,
    'C': 2.0,
    'C-': 1.7,
    'D+': 1.3,
    'D': 1.0,
    'F': 0.0,
  };
  // GPA calculation based on courses

  double calculateGpa(List<CourseModel> courses) {
    if (courses.isEmpty) return 0.0;
    double totalPoints = 0;
    int totalHours = 0;
    for (var course in courses) {
      totalPoints += course.gradeValue * course.hours;
      totalHours += course.hours;
    }
    return totalHours == 0 ? 0.0 : totalPoints / totalHours;
  }

  String _getGradeFromValue(double value) {
    return gradeMap.entries
        .firstWhere(
          (entry) => entry.value == value,
          orElse: () => const MapEntry('A', 4.0),
        )
        .key;
  }

  CourseBloc() : super(NameChangeState('', '', 'A', false, [])) {
    on<NameChangedEvent>((event, emit) {
      final currentState = state as NameChangeState;
      final name = event.name;
      final isValid =
          name.isNotEmpty &&
          RegExp(r'^[a-zA-Z\s]+$').hasMatch(name) &&
          int.tryParse(currentState.hours) != null;
      emit(
        NameChangeState(
          name,
          currentState.hours,
          currentState.grade,
          isValid,
          courses,
        ),
      );
    });
    on<HoursChangedEvent>((event, emit) {
      final currentState = state as NameChangeState;
      final hours = event.hours;
      final isValid =
          currentState.name.isNotEmpty &&
          RegExp(r'^[a-zA-Z\s]+$').hasMatch(currentState.name) &&
          int.tryParse(hours) != null;
      emit(
        NameChangeState(
          currentState.name,
          event.hours,
          currentState.grade,
          isValid,
          courses,
        ),
      );
    });
    on<GradeChangedEvent>((event, emit) {
      final currentState = state as NameChangeState;

      final isValid =
          currentState.name.isNotEmpty &&
          RegExp(r'^[a-zA-Z\s]+$').hasMatch(currentState.name) &&
          int.tryParse(currentState.hours) != null;
      emit(
        NameChangeState(
          currentState.name,
          currentState.hours,
          event.grade,
          isValid,
          courses,
        ),
      );
    });
    on<NameSubmitEvent>((event, emit) {
      final currentState = state as NameChangeState;
      if (currentState.isValid) {
        final parsedHours = int.tryParse(currentState.hours);
        final gradeValue = gradeMap[currentState.grade];
        if (parsedHours != null && gradeValue != null) {
          final newCourse = CourseModel(
            name: currentState.name,
            hours: parsedHours,
            gradeValue: gradeValue,
          );
          if (editingIndex != null) {
            courses[editingIndex!] = newCourse;
            editingIndex = null;
          } else {
            courses.add(newCourse);
          }

          emit(NameChangeState('', '', 'A', false, List.from(courses)));
        }
      }
    });
    on<DeleteCourseEvent>((event, emit) {
      courses.removeAt(event.index);
      final currentState = state as NameChangeState;
      emit(
        NameChangeState(
          currentState.name,
          currentState.hours,
          currentState.grade,
          currentState.isValid,
          List.from(courses),
        ),
      );
    });
    on<EditCourseEvent>((event, emit) {
      final course = courses[event.index];
      editingIndex = event.index;
      emit(
        NameChangeState(
          course.name,
          course.hours.toString(),
          _getGradeFromValue(course.gradeValue),
          true,
          List.from(courses),
        ),
      );
    });
  }
}
