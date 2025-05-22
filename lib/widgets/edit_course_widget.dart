import 'package:flutter/material.dart';

// -- Widgets
import 'package:gpa_calculator/widgets/custom_button_widget.dart';
import 'package:gpa_calculator/widgets/form_course_widget.dart';

// -- BLoC
import 'package:gpa_calculator/screens/home/bloc/gap_calculator_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// -- Model 
import 'package:gpa_calculator/models/course_model.dart';

// -- Utilities (Extensions)
import 'package:gpa_calculator/utilities/screen/extensions/screen_size.dart';



// ignore: must_be_immutable
class EditCourseWidget extends StatelessWidget {

  /// [EditCourseWidget] A widget that provides a form interface for editing an existing course.
  EditCourseWidget({super.key, required this.gapBloc, required this.course, required this.index});
  int index;
  final CourseModel course; 
  late String selectedGrade;
  final List<String> grades = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];
  final GlobalKey<FormState> _formKey = GlobalKey();

  GapCalculatorBloc gapBloc;

  

  @override
  Widget build(BuildContext context) {

    final TextEditingController courseNameController = TextEditingController(text: course.courseName);
    final TextEditingController courseHoursCreditsController = TextEditingController(text: course.creditHours);
    selectedGrade = course.grade;
    
    return BlocProvider.value(
      value: gapBloc,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [

              FormCourseWidget(
                formKey: _formKey,
                courseNameController: courseNameController,
                courseHoursCreditsController: courseHoursCreditsController,
                onSelectedGrade:(value) => selectedGrade = value!,
                selectedGrade: course.grade,
              ),

              SizedBox(height: context.getHeight(multiplied: 0.09)),

              CustomButtonWidget(
                label: 'Edit Course', 
                onTap: (){
                  if (_formKey.currentState!.validate()) {
                    final courseName = courseNameController.text;
                    final courseHoursCredits = courseHoursCreditsController.text;
                    final courseGrade = selectedGrade;

                    final course = CourseModel(
                      courseName: courseName,
                      creditHours: courseHoursCredits,
                      grade: courseGrade,
                    );

                    gapBloc.add(EditCourseEvent(index: index, course: course));

                    Future.delayed(Duration(milliseconds: 350), () {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    });
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
