import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/screens/add_course/bloc/add_course_bloc.dart';
import 'package:gpa_calculator/screens/add_course/widget/add_course_form.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddCourseBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Add Course")),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: AddCourseForm(),
        ),
      ),
    );
  }
}
