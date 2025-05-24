import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/screens/home/bloc/gpa_bloc.dart';
import '../models/course_model.dart';

class EditCourseScreen extends StatefulWidget {
  final Course course;

  const EditCourseScreen({super.key, required this.course});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  late TextEditingController nameController;
  late TextEditingController hoursController;
  String? selectedGrade;

  final List<String> grades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.course.courseName);
    hoursController =
        TextEditingController(text: widget.course.creditHours.toString());
    selectedGrade = widget.course.grade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit corse")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "course name"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "number of hours"),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedGrade,
              decoration: const InputDecoration(labelText: "grade"),
              items: grades
                  .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedGrade = val;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final updatedCourse = Course(
                  id: widget.course.id,
                  courseName: nameController.text,
                  grade: selectedGrade!,
                  creditHours: int.parse(hoursController.text),
                );

                context.read<GpaBloc>().add(UpdateCourseEvent(updatedCourse));

                Navigator.pop(context);
              },
              child: const Text("upadate"),
            )
          ],
        ),
      ),
    );
  }
}
