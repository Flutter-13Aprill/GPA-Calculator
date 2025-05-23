import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/course_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GPACalculatorApp());
}

class GPACalculatorApp extends StatelessWidget {
  const GPACalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( // With BlocProvider, you can access everything inside CourseBloc.
      create: (_) => CourseBloc(),
      child: MaterialApp(
        title: 'GPA Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home:  HomeScreen(),
      ),
    );
  }
}
