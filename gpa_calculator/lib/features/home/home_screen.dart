import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/extensions/screen/screen_size.dart';
import 'package:gpa_calculator/core/text/app_text.dart';
import 'package:gpa_calculator/core/theme/app_palette.dart';
import 'package:gpa_calculator/features/home/bloc/home_bloc.dart';
import 'package:gpa_calculator/features/edit/edit_course.dart';
import 'package:gpa_calculator/core/widget/coursname_textfield.dart';
import 'package:gpa_calculator/core/widget/hours_textfield.dart';
import 'package:gpa_calculator/core/widget/drop_down.dart';
import 'package:gpa_calculator/features/home/widgit/coustom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
      List<Map<String, dynamic>> homecourses = [];
      double totalGpa =0;
      double totalHours=0;
      double gpaResult =0;
      final addCourseFormkey = GlobalKey<FormState>();
      TextEditingController courseName = TextEditingController();
      TextEditingController courseHours = TextEditingController();
      TextEditingController courseGrade = TextEditingController();
        if (state is CourseAddedState) {
          homecourses = state.stateCourses;
           for (var course in homecourses) {
            totalHours += course['hours'];
            totalGpa += course['total'];
            }
           gpaResult =totalGpa/totalHours;
         
        }
    if (state is CourseDuplicatedState) {
          homecourses = state.updatedCourse;
           for (var course in homecourses) {
            totalHours += course['hours'];
            totalGpa += course['total'];
            }
           gpaResult =totalGpa/totalHours;
         
        }
        return Scaffold( backgroundColor: AppPalette.lightPurbleColor,
          appBar: AppBar(backgroundColor: AppPalette.purbleColor,centerTitle: true, title: Text(AppText.gpaCalculator)),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.getShortest(per: 1),horizontal: context.getShortest(per: 0.15)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if(gpaResult != 0)
                    Text(AppText.yourGpaIs+gpaResult.toStringAsFixed(2),style: TextStyle(color: AppPalette.whiteColor,fontWeight: FontWeight.bold,fontSize: context.getShortest(per: 0.75)),),
                    Form(
                          key: addCourseFormkey,
                          child: Row(
                            children: [
                            Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: CoursnameTextfield(
                                textController: courseName,
                              ),
                            ),
                            ),
                            Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: HoursTextfield(
                                textController: courseHours,
                              ),
                            ),
                            ),
                            Expanded(
                            flex: 2,
                            child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: CustomDropdown(fontsize: context.getShortest(per: 0.37), label: Text(AppText.selectGrade,style: TextStyle(fontSize: context.getShortest(per: 0.35)),), controller: courseGrade),
                            ),
                            ),
                            ],
                            ),
                          ),
                          IconButton(
                          onPressed: () {
                          if (courseGrade.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(AppText.selectGradeFirstly)),
                          );
                          return;
                          } 
                          if (addCourseFormkey.currentState!.validate()) {
                            context.read<HomeBloc>().add(AddCourseEvent(
                            homeBlocCourse: courseName.text,
                            homeBlocHours: double.tryParse(courseHours.text) ?? 1.00,
                            homeBlocGrade: courseGrade.text,
                            ));
                            courseName.clear();
                            courseHours.clear();
                          }
                          },
                          icon: Icon(Icons.add_circle, color: AppPalette.purbleColor),
                          iconSize: 50,
                          ),
                          SizedBox(height: context.getShortest(per: 0.2)),
                         if(state is CourseDuplicatedState) 
                          Text(AppText.courseAlreadyExists,style: TextStyle(color:AppPalette.whiteColor,fontWeight: FontWeight.bold ),),
                          
    
                    ListView.builder(
                      itemCount: homecourses.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final homecourse = homecourses[index];
                        return CustomCardWidget(dismissibleKey: Key(homecourse['course']), confirmDismiss: (direction) async {
    if (direction == DismissDirection.endToStart) {
     
      return true; 
    } else {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: context.read<HomeBloc>(),
            child: EditCourse(
              course: homecourse['course'],
              hours: homecourse['hours'],
              grade: homecourse['grade'],
            ),
          ),
        ),
      );
      return false; 
    }
  },
  onDismissed: (direction) {
    if (direction == DismissDirection.endToStart) {
      context.read<HomeBloc>().add(
        DeleteCourseEvent(homeBlocCourse: homecourse['course']),
      );
    }
  },
  leftContainerColor: AppPalette.lightbege,
  leftContainerIcon: Icons.edit,
  leftContainerIconColor: AppPalette.black,
  rightContainerColor: AppPalette.lightred,
  rightContainerIcon: Icons.delete,
  rightContainerIconColor: AppPalette.black,
  title: Text(homecourse['course']),
  subtitle: Text('Hours: ${homecourse['hours']}'),
  trailing: Text(homecourse['grade']),
);}
                           ),
                          
                          
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );}}