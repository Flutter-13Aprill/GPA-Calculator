import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_course_event.dart';
part 'add_course_state.dart';

class AddCourseBloc extends Bloc<AddCourseEvent, AddCourseState> {
  AddCourseBloc() : super(AddCourseState.initial()) {
    on<CourseNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<CourseHoursChanged>((event, emit) {
      emit(state.copyWith(hours: event.hours));
    });

    on<CourseGradeChanged>((event, emit) {
      emit(state.copyWith(grade: event.grade));
    });
  }
}
