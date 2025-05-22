import 'package:flutter/material.dart';
import 'package:gpa_calculator/theming/app_colors.dart';
import 'package:gpa_calculator/widgets/custom_text_form_field.dart';

class FormCourseWidget extends StatelessWidget {

  /// [FormCourseWidget] A form widget for adding or editing course information.
  ///
  /// Includes fields for course name, credit hours, and grade selection.
  /// 
  /// Performs validation to ensure all fields are properly filled before submission.
  /// 
  /// Can be used for both adding and editing courses depending on the context.
  FormCourseWidget({ super.key,required this.formKey,required this.courseNameController,required this.courseHoursCreditsController,required this.onSelectedGrade, required this.selectedGrade});

  final GlobalKey<FormState> formKey;
  final TextEditingController courseNameController;
  final TextEditingController courseHoursCreditsController;
  final List<String> grades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
  final String? selectedGrade;
  final void Function(String? value) onSelectedGrade;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: courseNameController,
            labelText: 'Course name',
            onValidate: (value) {
              if (value!.trim().isEmpty) {
                return 'Please make sure to enter course name';
              }
              return null;
            },
          ),

          Divider(),

          Row(
            spacing: 24,
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  value: selectedGrade,
                  focusColor: AppColors.primaryColor,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  hint: Text('Grade'),
                  items:grades.map((grade) {
                    return DropdownMenuItem(value: grade, child: Text(grade));
                    }).toList(),
                  onChanged: onSelectedGrade,
                  validator: (value) {
                    if (value == null) {
                      return 'Please make sure\nto enter a grade';
                    }
                    return null;
                  },
                ),
              ),

              Expanded(
                child: CustomTextFormField(
                  controller: courseHoursCreditsController,
                  labelText: 'Credit Hours',
                  onValidate: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please make sure \nto enter course\'s\ncredit hours ';
                    } else if (int.parse(value) <= 0) {
                      return 'Please make sure\nthe number is greater \nthan zero';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
