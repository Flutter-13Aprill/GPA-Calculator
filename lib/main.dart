import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/gpa/bloc/gpa_bloc.dart';
import 'screen/gpa/gpa_screen.dart';

void main() {
  runApp(const GpaApp());
}

class GpaApp extends StatelessWidget {
  const GpaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(create: (_) => GpaBloc(), child: const GpaScreen()),
    ); //GpaScreen the screen that benefits from bloc
  }
}
