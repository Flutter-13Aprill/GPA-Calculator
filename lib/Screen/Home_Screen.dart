import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/Screen/Add_Edit_Course_Screen.dart';
import 'package:gpa_calculator/Screen/bloc/course_bloc.dart';
import 'package:gpa_calculator/Screen/bloc/course_event.dart';
import 'package:gpa_calculator/Screen/bloc/course_state.dart';
import 'package:gpa_calculator/Widgets/Course_Card_Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide CourseBloc to the widget tree
      create: (_) => CourseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CourseBloc>();

          return Scaffold(
            body: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                return Column(
                  children: [
                    // Top section showing current GPA with styling
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Current GPA",
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Display GPA value formatted to 2 decimals
                          Text(
                            state.gpa.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Main content area showing list of courses or empty message
                    Expanded(
                      child:
                          state.courses.isEmpty
                              ? const Center(
                                child: Text(
                                  "No courses added yet.",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                              : ListView.builder(
                                padding: const EdgeInsets.only(bottom: 80),
                                itemCount: state.courses.length,
                                itemBuilder: (context, index) {
                                  final course = state.courses[index];
                                  return CourseCard(
                                    course: course,
                                    onEdit: () {
                                      // Navigate to edit screen with course details
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => AddEditCourseScreen(
                                                isEdit: true,
                                                course: course,
                                                index: index,
                                                bloc: bloc,
                                              ),
                                        ),
                                      );
                                    },
                                    onDelete:
                                        () =>
                                        // Dispatch event to delete course at index
                                        bloc.add(DeleteCourse(index)),
                                  );
                                },
                              ),
                    ),
                  ],
                );
              },
            ),

            // Floating action button to add a new course
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                // Navigate to add course screen with bloc passed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddEditCourseScreen(bloc: bloc),
                  ),
                );
              },
              label: const Text(
                "Add Course",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          );
        },
      ),
    );
  }
}
