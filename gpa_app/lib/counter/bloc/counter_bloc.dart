import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounterEvent) {
        counter = counter + 1;
        emit(ChangeValueCounterState(counter));
      } else if (event is DecrmentCounterEvent) {
        counter = counter - 1;
        emit(ChangeValueCounterState(counter));
      }
    });
  }
}
