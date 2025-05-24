import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../model/course_model.dart';

part 'gpa_event.dart';
part 'gpa_state.dart';

class GpaBloc extends Bloc<GpaEvent, GpaState> {
  GpaBloc() : super(const GpaState()) {
    on<AddCourse>((event, emit) {
      final updated = List<Course>.from(state.courses)..add(event.course);
      emit(state.copyWith(courses: updated));//We send a new copy of the status (emit)
    });

    on<UpdateCourse>((event, emit) {
      final updated = List<Course>.from(state.courses);
      updated[event.index] = event.updatedCourse; //We replace the existing value in the event.index with the new value.
      emit(state.copyWith(courses: updated));
    });

    on<DeleteCourse>((event, emit) {
      final updated = List<Course>.from(state.courses)..removeAt(event.index); //We delete the course in event.index
      emit(state.copyWith(courses: updated));
    });
  }
}
