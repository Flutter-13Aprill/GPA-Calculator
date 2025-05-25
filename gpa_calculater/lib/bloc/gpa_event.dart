part of 'gpa_bloc.dart';

@immutable
sealed class GpaEvent {}


class addsubject extends GpaEvent{
  final Taskmodel task;

  addsubject({required this.task});
}

class deletesubject extends GpaEvent{
  final Taskmodel task;

  deletesubject({required this.task});
  
}

class editsubject extends GpaEvent{
  final Taskmodel oldtask;
  final Taskmodel updatetask;

  editsubject({required this.oldtask, required this.updatetask});
}