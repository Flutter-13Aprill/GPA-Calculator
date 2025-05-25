import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calc/bloc/home/persentation/page/addCourseScreen.dart';
import 'package:gpa_calc/bloc/home_bloc.dart';
import 'package:gpa_calc/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('GPA Calculator')),
            body: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('GPA: ${state.gpa.toStringAsFixed(2)}'),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.courses.length,
                          itemBuilder: (context, index) {
                            final course = state.courses[index];
                            return ListTile(
                              title: Text(course.name),
                              subtitle: Text(
                                '${course.hourse} ساعات - ${course.grade}',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: Builder(
              builder:
                  (innerContext) => FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        innerContext,
                        MaterialPageRoute(
                          builder: (_) => const AddCourseScreen(),
                        ),
                      );
                    },
                  ),
            ),
          );
        },
      ),
    );
  }
}
