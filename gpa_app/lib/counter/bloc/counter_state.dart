part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class ChangeValueCounterState extends CounterState {
  final int counter;

  ChangeValueCounterState(this.counter);
}
