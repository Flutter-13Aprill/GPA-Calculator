import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/model/course_model.dart';
import 'package:gpa_calculator/screen/home/bloc/gpa_calculator_bloc.dart';
import 'package:gpa_calculator/widget/course_card.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> grades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
    String? selectedGrade;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController courseController = TextEditingController();
    TextEditingController creditHoursController = TextEditingController();
    String grade = "A+";

    return BlocProvider(
      create: (context) => GpaCalculatorBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<GpaCalculatorBloc>();
          return Column(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 60),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: TextFormField(
                              controller: courseController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please write course name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Course name",
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 100,
                            child: DropdownButtonFormField(
                              value: selectedGrade,
                              decoration: InputDecoration.collapsed(
                                hintText: '',
                              ),
                              hint: Text('Grade'),
                              items:
                                  grades.map((grade) {
                                    return DropdownMenuItem(
                                      value: grade,
                                      child: Text(grade),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                grade = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "Enter a grade";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: TextFormField(
                              controller: creditHoursController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "please write course name";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Credit hours",
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final newCourse = CourseModel(
                                  courseName: courseController.text,
                                  creditHours: creditHoursController.text,
                                  grade: grade,
                                );

                                bloc.add(
                                  CreateNewCourse(
                                    cours: newCourse,
                                    grade: grade,
                                  ),
                                );
                              }
                            },
                            child: Text("Add course"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  BlocBuilder<GpaCalculatorBloc, GpaCalculatorState>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return Column(
                          children: [
                            Text(
                              " GPA :${state.grade}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              children:
                                  state.courses
                                      .map(
                                        (item) => CourseCard(
                                          CourseName: item.courseName,
                                          creditHours: item.creditHours,
                                          grade: item.grade,
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                        );
                      }
                      return Text("");
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
