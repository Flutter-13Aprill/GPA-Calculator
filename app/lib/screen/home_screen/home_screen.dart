import 'dart:math';

import 'package:app/models/courses_model.dart';
import 'package:app/screen/home_screen/bloc/courses_bloc.dart';
import 'package:app/screen/home_screen/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:app/screen/home_screen/widgets/container/courses_container.dart';
import 'package:app/screen/home_screen/widgets/drob_down_menu/drob_down_menu_courses.dart';
import 'package:app/screen/home_screen/widgets/form/form_widget.dart';
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //define GlobalKey for form
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //define Controller  for text feild
    TextEditingController courseNameController = TextEditingController();
    TextEditingController creditHoursController = TextEditingController();
    double grade = 0; //define grade with initialize value 0

    // Defines a BlocProvider to make the CoursesBloc available to its children.
    return BlocProvider(
      create: (context) => CoursesBloc(), // Creates an instance of CoursesBloc.
      child: Builder(
        // Uses a Builder to get a new BuildContext that can access the CoursesBloc.
        builder: (context) {
          return Scaffold(
            // Uses a Builder to get a new BuildContext that can access the CoursesBloc.
            appBar: AppBar(
              title: const Text("GPA Calculator"),
            ), // Sets the app bar with the title "GPA Calculator".
            body: SingleChildScrollView(
              // Allows the content to be scrollable if it exceeds the screen height.
              child: Column(
                // Arranges its children in a vertical column.
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    // Arranges its children in a vertical column.
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      // Arranges its children in a vertical column.
                      key:
                          formKey, // Associates a GlobalKey with this Form for validation.
                      child: Column(
                        // Arranges its children in a vertical column.
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FormWidget(
                            // Custom widget for a form input field.
                            validator: (value) {
                              // Checks if the value is null or empty after trimming.
                              if (value == null || value.trim().isEmpty) {
                                return "Course name must not be empty."; // Checks if the value is null or empty after trimming.
                              }
                              return null; // Returns null if validation passes.
                            },
                            ControllerTextFeild:
                                courseNameController, // Assigns the controller for the text field.
                            hintText:
                                "Enter Course Name", // Placeholder text for the input field.
                          ),
                          const SizedBox(height: 15), // Adds vertical space.
                          FormWidget(
                            // Validator function for the credit hours.
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Credit hours must not be empty.";
                              }
                              final numericRegex = RegExp(
                                r'^\d+$',
                              ); // Regular expression to check for digits only.
                              if (!numericRegex.hasMatch(value.trim())) {
                                // Checks if the value contains only digits.
                                return "Credit hours must be a valid number.";
                              }
                              return null; // Returns null if validation passes.
                            },
                            ControllerTextFeild:
                                creditHoursController, // Assigns the controller for the text field.
                            hintText:
                                "Enter Credit Hours", // Placeholder text for the input field.
                          ),
                          const SizedBox(height: 15),
                          // Custom widget for selecting the grade.
                          GradeDropdown(
                            // Callback function when the grade selection changes.
                            onChanged: (double value) {
                              grade = value; // Updates the 'grade' variable.
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            // A material design button.
                            onPressed: () {
                              // Callback function when the button is pressed.

                              if (formKey.currentState!.validate()) {
                                // Validates all form fields.
                                final newCourse = CoursesModel(
                                  // Creates a new CoursesModel instance.
                                  id: Random().nextInt(
                                    999999999,
                                  ), // Generates a random ID for the course.
                                  coursesname:
                                      courseNameController
                                          .text, // Gets the course name from the controller.
                                  grade: grade, // Uses the selected grade.
                                  crediHhours: int.parse(
                                    creditHoursController
                                        .text, // Parses credit hours to an integer.
                                  ),
                                ); // Dispatches an event to the CoursesBloc to add the new course.

                                context.read<CoursesBloc>().add(
                                  CreatNewcourse(courses: newCourse),
                                );
                                // Clear controllers after adding
                                courseNameController.clear();
                                creditHoursController.clear();
                                grade = 0; // Reset grade to default
                              }
                            },
                            child: const Text("Add Course"),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<CoursesBloc, CoursesState>(
                    // Rebuilds its UI based on changes in CoursesBloc's state.
                    builder: (context, state) {
                      if (state is SucssesAddState) {
                        // Builder function that receives the current BLoC state.
                        if (state.coursess.isEmpty) {
                          return const Center(
                            // Checks if the list of courses is empty.
                            child: Text(
                              "No courses added yet.",
                            ), // Displays a message when no courses are added.
                          );
                        }

                        // Calculate total GPA
                        double totalWeightedGrade = 0;
                        int totalCreditHours = 0;
                        for (var course in state.coursess) {
                          totalWeightedGrade +=
                              (course.grade * course.crediHhours);
                          totalCreditHours += course.crediHhours;
                        } // Calculates GPA if total credit hours are greater than 0.
                        double overallGpa =
                            totalCreditHours > 0
                                ? totalWeightedGrade / totalCreditHours
                                : 0; // Otherwise, GPA is 0.

                        return Column(
                          children: [
                            ...state.coursess
                                .map(
                                  // Maps each course in the list to a CoursesContainer widget.
                                  //dispaly all added Coursess
                                  (item) => Coursescontainer(
                                    coursesNmae: item.coursesname,
                                    creditHours: item.crediHhours.toString(),
                                    grade: item.grade,
                                    onDelete: () {
                                      context.read<CoursesBloc>().add(
                                        DeleteCourse(courseId: item.id),
                                      );
                                    },
                                    onChane: () {
                                      final parentContext =
                                          context; // Save the parent context
                                      showBottomSheetCoursse(
                                        item: item,
                                        parentContext: parentContext,
                                      );
                                   
                                    },
                                  ),
                                ),
                               // .toList(),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(//doisplay GPA
                                "Overall GPA: ${overallGpa.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      if (state is ErrorAddState) {//if ErrorAddState display 
                        return const Center(
                          child: Text(
                            "The data is not correct. Fix your bugs.",
                          ),
                        );
                      }
                      return const Center(//if no state habbened frm top display 
                        child: Text(
                          "No data available. Add your first course!",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
