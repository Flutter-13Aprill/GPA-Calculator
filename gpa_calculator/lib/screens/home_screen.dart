import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/course_bloc.dart';
import '../blocs/course_event.dart';
import '../blocs/course_state.dart';
import '../models/course_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

//formKey: to validate the form.
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final hoursController = TextEditingController();
  final List<String> grades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
  //ValueNotifier: controls the current value of the selected score and allows the UI to automatically rebuild when it changes.
  final ValueNotifier<String> selectedGradeNotifier = ValueNotifier<String>('A');

  @override
  Widget build(BuildContext context) {
    final courseBloc = BlocProvider.of<CourseBloc>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 189, 207),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            //Displays the calculated GPA using BlocBuilder.
            BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                return Text(
                  'GPA: ${state.gpa.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              },
            ),

            Expanded(
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state.courses.isEmpty) {
                    return const Center(child: Text('No courses added.'));
                  }
                  return ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      final course = state.courses[index];
                      return Card(
                        child: ListTile(
                          title: Text(course.name),
                          subtitle: Text('Grade: ${course.grade}, Hours: ${course.creditHours}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              courseBloc.add(RemoveCourse(index));
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const Spacer(flex: 1),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Course Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter course name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      //Tracks the change in the selected score.
                      ValueListenableBuilder<String>(
                        valueListenable: selectedGradeNotifier,
                        builder: (context, selectedGrade, _) {
                          return DropdownButtonFormField<String>(
                            value: selectedGrade,
                            items: grades
                                .map((grade) => DropdownMenuItem(
                                      value: grade,
                                      child: Text(grade),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                selectedGradeNotifier.value = value;
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Grade',
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),

                      TextFormField(
                        controller: hoursController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Credit Hours',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter credit hours';
                          }
                          final hours = int.tryParse(value);
                          if (hours == null || hours <= 0) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final course = Course(
                              name: nameController.text.trim(),
                              grade: selectedGradeNotifier.value,
                              creditHours: int.parse(hoursController.text.trim()),
                            );

                            courseBloc.add(AddCourse(course));

                            nameController.clear();
                            hoursController.clear();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: const Text('Add Course'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
