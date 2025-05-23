part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}
final class AddCourseSuccessful extends CourseState {}
final class DeleteCourseSuccessful extends CourseState {}
final class UpdatedCourseSuccessful extends CourseState {}
