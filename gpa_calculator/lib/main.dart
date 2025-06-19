import 'package:flutter/material.dart';
import 'package:gpa_calculator/bloc/gpa_bloc.dart';
import 'package:gpa_calculator/screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpaBloc(),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
