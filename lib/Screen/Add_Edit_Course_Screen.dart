import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/Screen/bloc/course_bloc.dart';
import 'package:gpa_calculator/Screen/bloc/course_event.dart';
import 'package:gpa_calculator/models/course_model.dart';

class AddEditCourseScreen extends StatelessWidget {
  final bool isEdit; // Flag to indicate Add or Edit mode
  final Course? course; // Existing course data for editing
  final int? index; // Index of the course in the list for update
  final CourseBloc bloc; // Bloc instance for managing course state

  AddEditCourseScreen({
    super.key,
    this.isEdit = false,
    this.course,
    this.index,
    required this.bloc,
  });

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // List of grade options including placeholder
  final _grades = [
    "Select Grade",
    'A+',
    'A',
    'B+',
    'B',
    'C+',
    'C',
    'D+',
    'D',
    'F',
  ];

  @override
  Widget build(BuildContext context) {
    // Controllers initialized with existing course data if editing
    final nameController = TextEditingController(text: course?.name ?? '');
    final creditController =
        TextEditingController(text: course?.credit.toString() ?? '');

    // Using ValueNotifier to manage selected grade state in a stateless widget
    final selectedGradeNotifier =
        ValueNotifier<String>(course?.grade ?? "Select Grade");

    return BlocProvider.value(
      value: bloc, // Provide existing bloc instance to the widget subtree
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context), // Back button
          ),
          title: Text(
            isEdit ? "Edit Course" : "Add Course",
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Form widget for validation
            child: ListView(
              children: [
                Align(
                  child: SizedBox(
                    width: 330,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Course Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.book),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                              ? 'Course name is required'
                              : null,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  child: SizedBox(
                    width: 330,
                    child: TextFormField(
                      controller: creditController,
                      decoration: InputDecoration(
                        labelText: 'Credit Hours',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.access_time),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          value == null || int.tryParse(value) == null
                              ? 'Enter a valid number'
                              : null,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 330,
                    // Listen to selectedGradeNotifier for dropdown updates
                    child: ValueListenableBuilder<String>(
                      valueListenable: selectedGradeNotifier,
                      builder: (context, selectedGrade, child) {
                        return DropdownButtonFormField<String>(
                          value: selectedGrade,
                          decoration: InputDecoration(
                            labelText: 'Grade',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: const Icon(Icons.grade),
                          ),
                          items: _grades.map((grade) {
                            return DropdownMenuItem<String>(
                              value: grade,
                              child: Text(
                                grade,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              selectedGradeNotifier.value = value; // Update selected grade
                            }
                          },
                          validator: (value) =>
                              value == null || value == "Select Grade"
                                  ? 'Please select a grade'
                                  : null,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Align(
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Validate form inputs
                        if (_formKey.currentState!.validate()) {
                          // Create new Course object from input values
                          final newCourse = Course(
                            name: nameController.text.trim(),
                            credit: int.parse(creditController.text.trim()),
                            grade: selectedGradeNotifier.value,
                          );

                          // Dispatch appropriate event to Bloc
                          if (isEdit && index != null) {
                            bloc.add(UpdateCourse(index!, newCourse));
                          } else {
                            bloc.add(AddCourse(newCourse));
                          }
                          Navigator.pop(context); // Return to previous screen
                        }
                      },
                      label: Text(
                        isEdit ? 'Update Course' : 'Add Course',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
