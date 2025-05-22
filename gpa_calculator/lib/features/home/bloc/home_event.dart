part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class AddCourseEvent extends HomeEvent {
final String homeBlocCourse;
  final double homeBlocHours;
  final String homeBlocGrade;

  AddCourseEvent({
    required this.homeBlocCourse,
    required this.homeBlocHours,
    required this.homeBlocGrade,
  });

}
////
class UpdateCourseEvent extends HomeEvent {
  final String originalCourse;
  final String updatedCourse;
  final double updatedHours;
  final String updatedGrade;
  UpdateCourseEvent({required this.originalCourse, required this.updatedCourse, required this.updatedHours, required this.updatedGrade});
}

class DeleteCourseEvent extends HomeEvent {
final String homeBlocCourse;
  

  DeleteCourseEvent({
    required this.homeBlocCourse,
    
  });

}
