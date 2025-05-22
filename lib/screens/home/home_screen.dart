import 'package:flutter/material.dart';

// -- Widgets
import 'package:gpa_calculator/widgets/add_course_widget.dart';
import 'package:gpa_calculator/widgets/course_bottom_sheet_widget.dart';
import 'package:gpa_calculator/widgets/course_widget.dart';
import 'package:gpa_calculator/widgets/edit_course_widget.dart';

// -- BLoC
import 'package:gpa_calculator/screens/home/bloc/gap_calculator_bloc.dart';

// -- External Package
import 'package:flutter_bloc/flutter_bloc.dart';

// -- App Theming
import 'package:gpa_calculator/theming/app_colors.dart';

// -- Utilities (Extensions)
import 'package:gpa_calculator/utilities/screen/extensions/screen_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GapCalculatorBloc(),

      child: Builder(
        builder: (context) {

          final gapBloc = context.read<GapCalculatorBloc>();

          return Scaffold(
              appBar: AppBar(
                title: Text('GPA Calculator',style: Theme.of(context).textTheme.titleLarge),
                flexibleSpace: Container(
                  decoration: BoxDecoration(gradient: AppColors.appBarColor),
                ),
              ),
              floatingActionButton: FloatingActionButton(

                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppColors.appBarColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.add,size: 30,color: AppColors.secondaryColor,
                  ),
                ),

                onPressed: () {
                  courseBottomSheetWidget(context: context, child: AddCourseWidget(gapBloc: gapBloc), gapBloc: gapBloc);
                },

              ),
              body: Container(
                width: context.getWidth(),
                height: context.getHeight(),
                margin: EdgeInsets.symmetric(horizontal: 8),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    BlocBuilder(
                      bloc: gapBloc,
                      builder: (context, state) {
                        if (state is ShoeCoursesState) {

                          final courses = state.courses;
                          final gpa = state.gpa;

                          return Column(
                            spacing: 24,
                            children: [

                              Text('GPA: ${gpa.toStringAsFixed(2)}'),
                              SizedBox(
                                height: context.getHeight(multiplied: 0.8),
                                child: ListView.builder(
                                  itemCount: courses.length,
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                      key: ValueKey(courses[index].courseName),
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        color: Colors.red,
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Icon(Icons.delete,color: Colors.white,size: 28,),
                                          ],
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        
                                        gapBloc.add(DeleteCourseEvent(index: index));
                                        
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          courseBottomSheetWidget(context: context, child: EditCourseWidget(gapBloc: gapBloc, course: courses[index], index: index), gapBloc: gapBloc);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          child: CourseWidget(course: courses[index]),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }

                        // -- If the state is GapCalculatorInitial it will show this
                        return Center(child: Text('No Courses Added'));
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
