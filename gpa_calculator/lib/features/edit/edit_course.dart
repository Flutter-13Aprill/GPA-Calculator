import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/extensions/screen/screen_size.dart';
import 'package:gpa_calculator/core/text/app_text.dart';
import 'package:gpa_calculator/core/theme/app_palette.dart';
import 'package:gpa_calculator/core/widget/coursname_textfield.dart';
import 'package:gpa_calculator/core/widget/hours_textfield.dart';
import 'package:gpa_calculator/features/home/bloc/home_bloc.dart';
import 'package:gpa_calculator/core/widget/drop_down.dart';

class EditCourse extends StatelessWidget {
  final String course;
  final double hours;
  final String grade;

  final GlobalKey<FormState> editCourseFormkey = GlobalKey<FormState>();
  final TextEditingController editCourseName;
  final TextEditingController editCourseHours;
  final TextEditingController editCourseGrade;

  EditCourse({
    super.key,
    required this.course,
    required this.hours,
    required this.grade,
  }) : editCourseName = TextEditingController(text: course),
       editCourseHours = TextEditingController(text: hours.toString()),
       editCourseGrade = TextEditingController(text: grade);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
     listener: (context, state) {
if (state is CourseAddedState) {
    
    editCourseName.clear();
    editCourseHours.clear();
    editCourseGrade.clear();

    
    Navigator.pop(context);
  }
},

      builder: (context, state) {
        return Scaffold(backgroundColor: AppPalette.lightPurbleColor,
          appBar: AppBar(backgroundColor: AppPalette.purbleColor,centerTitle: true, title: Text(AppText.editCourse)),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(context.getShortest(per: 1)),
                child: Column(
                  children: [
                    if (context.read<HomeBloc>().state is CourseDuplicatedState)
                      Text(AppText.courseAlreadyExists,style: TextStyle(color:AppPalette.whiteColor,fontWeight: FontWeight.bold ),),
                    Form(
                      key: editCourseFormkey,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: CoursnameTextfield(
                                textController: editCourseName,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: HoursTextfield(
                                textController: editCourseHours,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: CustomDropdown(fontsize: context.getShortest(per: 0.37), label: Text(AppText.selectGrade,style: TextStyle(fontSize: context.getShortest(per: 0.35)),),  controller: editCourseGrade)
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
  onPressed: () {
    if (editCourseFormkey.currentState!.validate()) {
      context.read<HomeBloc>().add(
        UpdateCourseEvent(
          originalCourse: course,
          updatedCourse: editCourseName.text,
          updatedHours: double.tryParse(editCourseHours.text) ?? 1.00,
          updatedGrade: editCourseGrade.text,
        ),
      );
      
    }
  },
  icon:  Icon(Icons.change_circle, color: AppPalette.whiteColor),
  iconSize: 50,
),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
