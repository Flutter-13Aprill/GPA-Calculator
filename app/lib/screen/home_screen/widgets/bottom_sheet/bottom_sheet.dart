import 'package:app/models/courses_model.dart';
import 'package:app/screen/home_screen/bloc/courses_bloc.dart';
import 'package:app/screen/home_screen/widgets/drob_down_menu/drob_down_menu_courses.dart';
import 'package:app/screen/home_screen/widgets/form/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showBottomSheetCoursse({
  required CoursesModel item,
  required BuildContext parentContext,
}) {
  TextEditingController editedCourseNameController = TextEditingController(
    // Pre-fills with current course name.
    text: item.coursesname,
  );
  TextEditingController editedCreditHoursController = TextEditingController(
    // Pre-fills with current credit hours.
    text: item.crediHhours.toString(),
  );
  double currentEditedGrade =
      item.grade; // Stores the current grade for editing.

  showModalBottomSheet(
    // Displays a modal bottom sheet for editing.
    context: parentContext,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          // Adjusts padding based on keyboard visibility.
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          // Arranges content in a vertical column.
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // Title of the edit form.
              "Edit Course: ${item.coursesname}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FormWidget(
              // Edit form for course name.
              validator: (value) {
                if (value == null || value.trim().isEmpty) {// validatation for coursses 
                  return "Course name must not be empty.";
                }
                return null;//if use enter value return nothig 
              },
              ControllerTextFeild: editedCourseNameController,//controllar form textfeild
              hintText: "Course Name",//hint for user 
            ),
            SizedBox(height: 15),
            FormWidget(//valdation  for Credit hours must be a number 
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Credit hours must not be empty.";
                }
                final numericRegex = RegExp(r'^\d+$');//define reglur experssion 
                if (!numericRegex.hasMatch(value.trim())) {
                  return "Credit hours must be a valid number.";
                }
                return null;//user valid input  return nothig 
              },
              ControllerTextFeild: editedCreditHoursController,//controllar form textfeild
              hintText: "Credit Hours",//hint for user 
            ),
            SizedBox(height: 15),
            GradeDropdown(//custom widgts for dsplay grade 
              initialGradeValue: currentEditedGrade,
              onChanged: (double value) {
                currentEditedGrade = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //call edit event
               //add new vaue 
                parentContext.read<CoursesBloc>().add(
                  EditCourse(
                    courseId: item.id,
                    newCourseName: editedCourseNameController.text,
                    newCreditHours: int.parse(editedCreditHoursController.text),
                    newGrade: currentEditedGrade,
                  ),
                );
                Navigator.pop(context); //   BottomSheet close
              },
              child: Text("Save Changes"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("close "),
            ),
          ],
        ),
      );
    },
  );
}
