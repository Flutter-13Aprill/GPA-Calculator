import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa/bloc/course_bloc.dart';

import '../models/course_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              var bloc = context.read<CourseBloc>();
              var courses = bloc.courses;
              void submitCourse() {
                if (bloc.formKey.currentState!.validate()) {
                  final String name = bloc.nameController.text;
                  final int grade = int.parse(
                    bloc.gradeController.dropDownValue!.value,
                  );
                  final int creditHours = int.parse(bloc.hourController.text);

                  CourseModel newCourse = CourseModel(
                    name: name,
                    grade: grade,
                    creditHours: creditHours,
                  );
                  bloc.add(AddNewCourse(course: newCourse));
                  bloc.nameController.clear();
                  bloc.hourController.clear();
                }
              }

              void editCourse(int courseIndex) {
                if (bloc.formKey.currentState!.validate()) {
                  final String name = bloc.nameController.text;
                  final int grade = int.parse(
                    bloc.gradeController.dropDownValue!.value,
                  );
                  final int creditHours = int.parse(bloc.hourController.text);

                  CourseModel updatedCourse = CourseModel(
                    name: name,
                    grade: grade,
                    creditHours: creditHours,
                  );
                  bloc.add(EditCourse(course: updatedCourse,courseIndex: courseIndex));
                  bloc.nameController.clear();
                  bloc.hourController.clear();
                }
              }

              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: bloc.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "total gpa : ${bloc.gpa} from 5  ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: bloc.nameController,
                          decoration: const InputDecoration(
                            labelText: 'Course Name',
                            hintText: 'e.g., Calculus I',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.school),
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the course name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 40,
                          child: DropDownTextField(
                            controller: bloc.gradeController,
                            clearOption: true,
                            searchDecoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.grade),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select a grade";
                              }
                              return null;
                            },
                            dropDownItemCount: 9,
                            dropDownList: const [
                              DropDownValueModel(name: 'A+', value: "95"),
                              DropDownValueModel(name: 'A', value: "90"),
                              DropDownValueModel(name: 'B+', value: "85"),
                              DropDownValueModel(name: 'B', value: "80"),
                              DropDownValueModel(name: 'C+', value: "75"),
                              DropDownValueModel(name: 'C', value: "70"),
                              DropDownValueModel(name: 'D+', value: "65"),
                              DropDownValueModel(name: 'D', value: "60"),
                              DropDownValueModel(name: 'F', value: "55"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: bloc.hourController,
                          decoration: const InputDecoration(
                            labelText: 'Credit Hours',
                            hintText: 'e.g., 3.0',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.hourglass_full),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter credit hours';
                            }
                            try {
                              double.parse(value);
                              if (double.parse(value) <= 0) {
                                return 'Credit hours must be positive';
                              }
                            } catch (e) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton.icon(
                          onPressed: submitCourse,
                          icon: const Icon(Icons.add),
                          label: const Text(
                            "Add Course",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          child: ListView.builder(
                            itemCount: courses.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(courses[index].name),
                                subtitle: Text(
                                  "credit hours : ${courses[index].creditHours}",
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        editCourse(index);
                                      },
                                      child: Text("edit"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        bloc.add(
                                          DeleteCourse(courseIndex: index),
                                        );
                                      },
                                      child: Text("delete"),
                                    ),
                                  ],
                                ),
                              );
                            },
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
      ),
    );
  }
}
