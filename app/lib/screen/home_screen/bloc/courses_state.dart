part of 'courses_bloc.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}


/// State indicating that a course operation (add, delete, edit) was successful.
/// Contains the updated list of courses. 
class SucssesAddState extends CoursesState {
  final List<CoursesModel> coursess;// define list  of CoursesModel

  SucssesAddState({required this.coursess});
}

/// State indicating that a course operation encountered an error.
class ErrorAddState extends CoursesState {}
