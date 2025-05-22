part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class SuccessfulyListingState extends HomeState {}
final class CourseAddedState extends HomeState {
  final List<Map<String, dynamic>> stateCourses;
  
  
  
  CourseAddedState(this.stateCourses);
}
final class CourseDuplicatedState extends HomeState{

  final List<Map<String, dynamic>> updatedCourse;
  
  
  
  CourseDuplicatedState(this.updatedCourse);

}