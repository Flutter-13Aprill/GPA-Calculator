import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_app/course/bloc/course_bloc.dart';
import 'package:gpa_app/model/coures_model.dart';
import 'package:gpa_app/widgets/custom_textfield.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({super.key});

  final nameController = TextEditingController();
  final hoursController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CourseBloc>();

          return Scaffold(
            appBar: AppBar(title: const Text('GPA Calculator')),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  String name = '';
                  bool isValid = true;
                  List<CourseModel> courses = [];
                  String hours = '';
                  final gradeMap = bloc.gradeMap;
                  final selectedGrade =
                      (state is NameChangeState) ? state.grade : 'A';

                  if (state is NameChangeState) {
                    name = state.name;
                    isValid = state.isValid;
                    courses = state.courses;
                    hours = state.hours;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      CustomTextField(
                        controller: nameController,
                        labelText: 'coures name',
                        errorText:
                            name.isEmpty ||
                                    RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)
                                ? null
                                : 'Only letters allowed',
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: hoursController,
                        keyboardType: TextInputType.number,
                        labelText: 'Hours',
                        errorText:
                            hours.isEmpty || int.tryParse(hours) != null
                                ? null
                                : 'Enter a valid number',
                      ),
                      const SizedBox(height: 20),

                      DropdownButtonFormField(
                        value: selectedGrade,
                        items:
                            gradeMap.keys
                                .map(
                                  (grade) => DropdownMenuItem(
                                    value: grade,
                                    child: Text(grade),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            bloc.add(GradeChangedEvent(val));
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Grade',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed:
                            isValid
                                ? () {
                                  bloc.add(
                                    NameChangedEvent(nameController.text),
                                  );
                                  bloc.add(
                                    HoursChangedEvent(hoursController.text),
                                  );
                                  bloc.add(NameSubmitEvent());
                                }
                                : null,
                        child: Text('Sumbit'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Saved Courses: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            final course = courses[index];
                            return ListTile(
                              title: Text(
                                '${course.name} - ${course.hours} hours - Grade: ${course.gradeValue}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      bloc.add(EditCourseEvent(index));
                                    },
                                    icon: Icon(Icons.edit, color: Colors.black),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      bloc.add(DeleteCourseEvent(index));
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      Text(
                        'GPA: ${bloc.calculateGpa(courses).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
