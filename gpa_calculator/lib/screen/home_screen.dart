import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/bloc/gpa_bloc.dart';
import 'package:gpa_calculator/bloc/gpa_event.dart';
import 'package:gpa_calculator/bloc/gpa_state.dart';
import 'package:gpa_calculator/models/gpa_model.dart';
import 'package:gpa_calculator/widget/dropdown_widget.dart';
import 'package:gpa_calculator/widget/gpa_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController courseController = TextEditingController();
    String? gradeSelected;
    final TextEditingController hoursController = TextEditingController();
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final bloc = context.read<GpaBloc>();
          showDialog(
            context: context,

            builder: (dialogContext) {
              return BlocProvider.value(
                value: bloc,
                child: AlertDialog(
                  actions: [
                    IconButton(
                      onPressed: () {
                        final storeCourses = GpaModel(
                          courseName: courseController.text,

                          grade: gradeSelected ?? '',

                          hours: hoursController.text,
                        );
                        bloc.add(CreateNewTask(course: storeCourses));
                      },
                      icon: Icon(Icons.check, color: Colors.green),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, color: Colors.red),
                    ),
                  ],
                  title: Text("Add new Course"),
                  content: SizedBox(
                    height: 180,

                    child: Column(
                      children: [
                        TextField(
                          controller: courseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Course Name',
                          ),
                        ),

                        BlocBuilder<GpaBloc, GpaState>(
                          builder: (context, state) {
                            String? selectGrades;
                            if (state is GpaSuccessState) {
                              selectGrades = state.grades;
                            }
                            return DropdownWidget(
                              value: selectGrades,
                              onChanged: (value) {
                                bloc.add(SelectedGrade(grade: value));
                                gradeSelected = value;
                              },
                            );
                          },
                        ),
                        TextField(
                          controller: hoursController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Hours ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add_box_rounded, color: Colors.green),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<GpaBloc, GpaState>(
                builder: (context, state) {
                  if (state is GpaSuccessState) {
                    return Column(
                      children: [
                        ...state.courses.map(
                          (item) => GpaWidget(
                            name: item.courseName,
                            hours: item.hours,
                            grade: item.grade,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Your GPA: ${calcGPA(state.courses).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }

                  return Text("No courses");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calcGPA(List<GpaModel> courses) {
    double totalPoints = 0;
    double totalHours = 0;

    for (var course in courses) {
      double gradePoint = DropdownWidget.items[course.grade] ?? 0;

      int hours = int.parse(course.hours);
      totalPoints = totalPoints + (gradePoint * hours);
      totalHours = totalHours + hours;
    }
    double gpa = totalPoints / totalHours;
    return gpa;
  }
}
