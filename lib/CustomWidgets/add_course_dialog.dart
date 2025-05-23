import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpabloc/Screens/Home/bloc/home_bloc.dart';

class AddCourseDialog extends StatelessWidget {
  AddCourseDialog({super.key, required this.listenerContext});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final BuildContext? listenerContext;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (listenerContext, state) {
        final bloc = context.read<HomeBloc>(); // ← use the existing bloc

        return AlertDialog(
          title: const Text('Add Course'),
          content: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    controller: bloc.courseNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter course name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "Course Name"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: bloc.courseCreditsController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          double.tryParse(value.trim()) == null) {
                        return 'Please enter course credits';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Course Credits",
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
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  bloc.add(AddCourseEvent());
                  Future.delayed(const Duration(milliseconds: 500), () {
                    formKey.currentState!.reset();
                    bloc.editCourseNameController.clear();
                    bloc.editCourseCreditsController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
