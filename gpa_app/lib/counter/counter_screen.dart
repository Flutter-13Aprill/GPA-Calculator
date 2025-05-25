import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_app/counter/bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CounterBloc>();
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is CounterInitial) {
                      return Text('counter is 0');
                    } else if (state is ChangeValueCounterState) {
                      return Text('counter is : ${state.counter}');
                    }
                    return Text('');
                  },
                ),
                FloatingActionButton(
                  onPressed: () {
                    bloc.add(IncrementCounterEvent());
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    bloc.add(DecrmentCounterEvent());
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
