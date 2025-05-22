import 'package:flutter/material.dart';

// -- Widget
import 'package:gpa_calculator/widgets/custom_button_widget.dart';

// -- BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/screens/home/bloc/gap_calculator_bloc.dart';

// -- Model
import 'package:gpa_calculator/models/course_model.dart';


// -- Utilities (Extensions)
import 'package:gpa_calculator/utilities/screen/extensions/screen_size.dart';
import 'package:gpa_calculator/widgets/form_course_widget.dart';

// ignore: must_be_immutable
class AddCourseWidget extends StatelessWidget {

  /// [AddCourseWidget] A widget that provides a form interface for adding a new course.
  ///
  /// This widget includes input fields such as course name, credit hours, and grade selection.
  AddCourseWidget({super.key, required this.gapBloc});

  // The default value of the drop down menu
  String selectedGrade = 'A+';
  final List<String> grades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseHoursCreditsController = TextEditingController();

  GapCalculatorBloc gapBloc;

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider.value(
      value: gapBloc,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),

        child: Container(
          height: context.getHeight(),
          padding: EdgeInsets.all(16),

          child: Column(
            children: [

              FormCourseWidget(
                formKey: _formKey, 
                courseNameController: courseNameController, 
                courseHoursCreditsController: courseHoursCreditsController, 
                selectedGrade: selectedGrade,
                onSelectedGrade: (value) => selectedGrade = value!,
              ),
              
              // The validation messages can shift the position of the button.
              // To fix this:
              // - Add a spacer between the form and the button.
              // - Add a SizedBox below the button to maintain consistent layout.
              Spacer(),

              CustomButtonWidget(
                label: 'Add New Course',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final courseName = courseNameController.text;
                    final courseHoursCredits = courseHoursCreditsController.text;
                    final courseGrade = selectedGrade;

                    final course = CourseModel( courseName: courseName, creditHours: courseHoursCredits, grade: courseGrade,);

                    gapBloc.add(AddNewCourseEvent(course: course));

                    Future.delayed(Duration(milliseconds: 350), () {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    });
                  }
                },
              ),

              SizedBox(height: context.getHeight(multiplied: 0.04)),
            ],
          ),
        ),
      ),
    );
  }
}
