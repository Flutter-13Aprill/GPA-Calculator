part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class AddItemEvent extends HomeEvent {}

class EditItemEvent extends HomeEvent {}

class RemoveItemEvent extends HomeEvent {}

class DisplayGpaEvent extends HomeEvent {}
