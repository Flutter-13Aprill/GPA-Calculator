import 'package:flutter/material.dart';
import 'package:gpa_calculator/home/widget/buttom_widget.dart';
import 'package:gpa_calculator/home/widget/text_field_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  /// A bottom sheet widget for adding or editing a course.
  ///
  /// Contains form fields for course name, credit hours, and grade selection,
  /// with validation and a submit button.
  ///
  /// Parameters:
  /// - [inputCourse]: Controller for the course name input.
  /// - [inputCredit]: Controller for the credit hours input.
  /// - [selectedValue]: Currently selected grade value.
  /// - [addCourse]: Callback invoked when the form is submitted successfully.
  /// - [onChanged]: Callback for grade dropdown value changes.
  BottomSheetWidget({
    super.key,
    required this.inputCourse,
    required this.inputCredit,
    required this.selectedValue,

    this.addCourse,
    this.onChanged,
  });
  final TextEditingController inputCourse;
  final TextEditingController inputCredit;
  final String selectedValue;
  final Function()? addCourse;
  final void Function(String?)? onChanged;
  final List<String> grade = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Form(
          key: _keyForm,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                TextFieldWidget(
                  input: inputCourse,
                  labelText: "Course name",
                  hintText: "Enter course name",
                  validare: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter course name';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFieldWidget(
                        input: inputCredit,
                        labelText: "Credit hours",
                        hintText: "Enter credit hours",
                        validare: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter credit hours';
                          }
                          final credit = int.tryParse(value);
                          if (credit == null) {
                            return 'Only numbers are allowed';
                          }
                          if (credit <= 0) {
                            return 'Must be greater than 0';
                          }
                          if (credit > 10) {
                            return 'Maximum 10 hours allowed';
                          }
                          return null;
                        },
                      ),
                    ),
                    Flexible(
                      child: DropdownButton(
                        value: selectedValue,
                        items:
                            grade.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
                ButtomWidget(
                  onTab: () {
                    if (_keyForm.currentState?.validate() ?? false) {
                      addCourse?.call();
                    }
                  },
                  textElevatedButton: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
