import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/models/course_model.dart';
import 'package:gpa_calculator/screens/add_course/bloc/add_course_bloc.dart'
    hide AddCourseEvent;
import 'package:gpa_calculator/screens/home/bloc/gpa_bloc.dart';

class AddCourseForm extends StatelessWidget {
  const AddCourseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCourseBloc, AddCourseState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Course Name'),
              onChanged: (value) {
                context
                    .read<AddCourseBloc>()
                    .add(CourseNameChanged(name: value));
              },
            ),
            const SizedBox(height: 16),

            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number of Hours '),
              onChanged: (value) {
                context
                    .read<AddCourseBloc>()
                    .add(CourseHoursChanged(hours: value));
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: state.grade,
              decoration: const InputDecoration(labelText: 'Grade'),
              items: const [
                'A+',
                'A',
                'B+',
                'B',
                'C+',
                'C',
                'D+',
                'D',
                'F',
              ].map((grade) {
                return DropdownMenuItem(
                  value: grade,
                  child: Text(grade),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  context
                      .read<AddCourseBloc>()
                      .add(CourseGradeChanged(grade: value));
                }
              },
            ),
            const SizedBox(height: 24),

            // add button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (state.isValid) {
                    final course = Course(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      courseName: state.name,
                      grade: state.grade!,
                      creditHours: int.parse(state.hours),
                    );
                    context.read<GpaBloc>().add(AddCourseEvent(course));

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill in all fields correctly"),
                      ),
                    );
                  }
                },
                child: const Text('Add'),
              ),
            )
          ],
        );
      },
    );
  }
}
