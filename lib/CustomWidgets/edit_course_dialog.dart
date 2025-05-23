import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpabloc/Models/course_model.dart';
import 'package:gpabloc/Screens/Home/bloc/home_bloc.dart';

class EditCourseDialog extends StatelessWidget {
  EditCourseDialog({super.key, required this.course, required this.index});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final int index;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>(); // ← use the existing bloc
        return AlertDialog(
          title: const Text('Edit Course'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    controller: bloc.editCourseNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter course name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: course.courseName),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: bloc.editCourseCreditsController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          double.tryParse(value.trim()) == null) {
                        return 'Please enter course credits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: course.courseCredits.toString(),
                    ),
                  ),
                  DropdownButton(
                    value: bloc.selectedGrade,
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(value: "A+", child: Text("A+")),
                      DropdownMenuItem(value: "A", child: Text("A")),
                      DropdownMenuItem(value: "B+", child: Text("B+")),
                      DropdownMenuItem(value: "B", child: Text("B")),
                      DropdownMenuItem(value: "C+", child: Text("C+")),
                      DropdownMenuItem(value: "C", child: Text("C")),
                      DropdownMenuItem(value: "D+", child: Text("D+")),
                      DropdownMenuItem(value: "D", child: Text("D")),
                      DropdownMenuItem(value: "F", child: Text("F")),
                    ],
                    onChanged: (value) {
                      bloc.selectedGrade = value!;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  bloc.add(EditCourseEvent(course, index));
                  Future.delayed(const Duration(milliseconds: 500), () {
                    formKey.currentState!.reset();
                    bloc.editCourseNameController.clear();
                    bloc.editCourseCreditsController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
