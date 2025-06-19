import 'package:bloc/bloc.dart';
import 'package:gpa_calculator/bloc/gpa_event.dart';
import 'package:gpa_calculator/bloc/gpa_state.dart';
import 'package:gpa_calculator/models/gpa_model.dart';

class GpaBloc extends Bloc<GpaEvent, GpaState> {
  List<GpaModel> coursesList = [];
  String? gradesSelected;
  GpaBloc() : super(GpaInitial()) {
    on<CreateNewTask>((event, emit) {
      coursesList.add(event.course);
      emit(GpaSuccessState(courses: List.from(coursesList)));
    });
    on<SelectedGrade>((event, emit) {
      gradesSelected = event.grade;
      emit(
        GpaSuccessState(
          courses: List.from(coursesList),
          grades: gradesSelected,
        ),
      );
      // emit(GpaSuccessState(courses: List.from(coursesList)));
    });
  }
}
