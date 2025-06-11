part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// listview return
class SuccefullState extends HomeState{}

// appbar return
class SuccefullCalcualteGpaState extends HomeState{}

