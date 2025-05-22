import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  double allGpa=0;
  final List<Map<String, dynamic>> blocCourses = [];
 double totalOfGpa=0 ;
 double courseResult=0;
 double hoursResult=0;
 double allhours=0;
 double total= 0;
  HomeBloc() : super(HomeInitial()) {
   on<AddCourseEvent>((event, emit) {
  final checkCourseName = blocCourses.any((course) => course['course'] == event.homeBlocCourse);
  
  if (!checkCourseName) {
    double gpa = 0;

    switch (event.homeBlocGrade) {
      case 'A+':
        gpa += 5;
        break;
      case 'A':
        gpa += 4.75;
        break;
      case 'B+':
        gpa += 4.5;
        break;
        case 'B':
        gpa += 4;
        break;
        case 'C+':
        gpa += 3.50;
        break;
        case 'C':
        gpa += 3;
        break;
        case 'D+':
        gpa += 2.5;
        break;
        case 'D':
        gpa += 2;
        break;
        case 'F':
        gpa += 1;
        break;
      
      default:
        gpa += 0;
    }
courseResult=gpa *event.homeBlocHours;
    
    blocCourses.add({
      'course': event.homeBlocCourse,
      'hours': event.homeBlocHours,
      'grade': event.homeBlocGrade,
      'total':courseResult
      
    });

    emit(CourseAddedState(List.from(blocCourses)));
  } else {
    emit(CourseDuplicatedState(blocCourses));
  }
});

    
  on<UpdateCourseEvent>((event, emit) {
  final index = blocCourses.indexWhere((c) => c['course'] == event.originalCourse);
  if (index != -1) {
     final isDuplicate = blocCourses.any((c) =>
        c['course'] == event.updatedCourse && c['course'] != event.originalCourse);
    
    if (isDuplicate) {
      emit(CourseDuplicatedState(blocCourses));
      return;
    }
     double gpa = 0;

    switch (event.updatedGrade) {
      case 'A+':
        gpa += 5;
        break;
      case 'A':
        gpa += 4.75;
        break;
      case 'B+':
        gpa += 4.5;
        break;
        case 'B':
        gpa += 4;
        break;
        case 'C+':
        gpa += 3.50;
        break;
        case 'C':
        gpa += 3;
        break;
        case 'D+':
        gpa += 2.5;
        break;
        case 'D':
        gpa += 2;
        break;
        case 'F':
        gpa += 1;
        break;
      
      default:
        gpa += 0;
    }
    courseResult=gpa *event.updatedHours;
    blocCourses[index] = {
      'homeBlocCourse': event.updatedCourse,
      'hours': event.updatedHours,
      'grade': event.updatedGrade,
      'total':courseResult
    };
  
    emit(CourseAddedState(List.from(blocCourses)));
  }
});

on<DeleteCourseEvent>((event, emit) {
  blocCourses.removeWhere((course) => course['course'] == event.homeBlocCourse);
  emit(CourseAddedState(List.from(blocCourses))); 
});
  }
  

  }

