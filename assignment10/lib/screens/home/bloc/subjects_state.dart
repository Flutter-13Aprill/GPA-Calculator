part of 'subjects_bloc.dart';

@immutable
sealed class SubjectsState {}

// final class SubjectsInitial extends SubjectsState {}


final class SubjectsInitial extends SubjectsState{}

final class SuccessState extends SubjectsState{}


final class SuccessStateGrade extends SubjectsState{

  final double? value;
  
  SuccessStateGrade({this.value});

}

