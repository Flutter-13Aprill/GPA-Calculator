import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/gpa_bloc.dart';
import '../model/course_model.dart';
import 'grade_dropdown.dart';

class AddEditCourseScreen extends StatelessWidget {
  final Course? course;
  final int? index;

  const AddEditCourseScreen({super.key, this.course, this.index});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); //for validate

    final nameController = TextEditingController(text: course?.name ?? '');
    final creditController = TextEditingController(
      text: course?.creditHours?.toString() ?? '',
    );
    String selectedGrade = course?.grade ?? 'A'; //defult

    return Scaffold(
      appBar: AppBar(title: Text(index == null ? 'Add Course' : 'Edit Course')), //A top bar displays "Add Course" or "Edit Course" as the case may be.
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: StatefulBuilder(
          
            builder: (context, setState) {
              return ListView(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Course Name'),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Please enter course name' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: creditController,
                    decoration: const InputDecoration(
                      labelText: 'Credit Hours',
                    ),
                    keyboardType: TextInputType.number,
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Please enter credit hours' : null,
                  ),
                  const SizedBox(height: 16),
                  GradeDropdown( //When the user changes the grade, we update the selectedGrade using setState inside the StatefulBuilder.
                    value: selectedGrade,
                    onChanged: (val) => setState(() => selectedGrade = val),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newCourse = Course(
                          name: nameController.text.trim(),
                          grade: selectedGrade,
                          creditHours: int.parse(creditController.text),
                        );

                        final bloc = context.read<GpaBloc>();

                        if (index == null) {
                          bloc.add(AddCourse(newCourse));
                        } else {
                          bloc.add(UpdateCourse(index!, newCourse));
                        }

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
