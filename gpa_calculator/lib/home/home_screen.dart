import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/home/bloc/course_bloc.dart';
import 'package:gpa_calculator/home/model/course_model.dart';
import 'package:gpa_calculator/home/widget/bottom_sheet_widget.dart';
import 'package:gpa_calculator/home/widget/course_widget.dart';
import 'package:gpa_calculator/home/widget/title_widget.dart';
import 'package:gpa_calculator/style/style_color.dart';

/// Main screen for the GPA Calculator app.
///
/// Displays the GPA and a list of courses with options to add, edit, or delete courses.
/// Uses `CourseBloc` for state management and shows bottom sheets for course input.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<CourseBloc>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 70),
                child: Column(children: [TitleWidget()]),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: BlocBuilder<CourseBloc, CourseState>(
                    builder: (context1, state) {
                      if (state is LoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is SuccessListState) {
                        return Center(
                          child: Column(
                            spacing: 16,
                            children: [
                              Text(
                                'Your GPA is: ${state.gpa}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: StyleColor.white,
                                ),
                              ),
                              ...state.courseList.map(
                                (item) => CourseWidget(
                                  courseName: item.course,
                                  courseDetails:
                                      '${item.grade}, ${item.houres}',
                                  ondelete: () {
                                    bloc.add(DeleteCourseEvent(course: item));
                                  },
                                  onEdit: () {
                                    bloc.inputCourse.text = item.course;
                                    bloc.inputCredit.text =
                                        item.houres.toString();
                                    bloc.dropdownValue = item.grade;
                                    showModalBottomSheet(
                                      context: context,
                                      showDragHandle: true,
                                      backgroundColor: StyleColor.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder:
                                          (context) => BottomSheetWidget(
                                            inputCourse: bloc.inputCourse,
                                            inputCredit: bloc.inputCredit,
                                            selectedValue: bloc.dropdownValue,

                                            addCourse: () {
                                              final updatedCourse = CourseModel(
                                                course: bloc.inputCourse.text,
                                                grade: bloc.dropdownValue,
                                                houres: int.parse(
                                                  bloc.inputCredit.text,
                                                ),
                                              );

                                              bloc.add(
                                                EditCourseEvent(
                                                  oldCourse: item,
                                                  updatedCourse: updatedCourse,
                                                ),
                                              );
                                              Navigator.of(context).pop();
                                            },

                                            onChanged: (value) {
                                              bloc.add(
                                                DropdownEvent(value: value!),
                                              );
                                            },
                                          ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is ErrorState) {
                        return Center(
                          child: Text(
                            "The data is not corrct fix your bugs",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: StyleColor.white,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          "No course add",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: StyleColor.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.inputCourse.clear();
                bloc.inputCredit.clear();

                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: StyleColor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder:
                      (context) => BottomSheetWidget(
                        inputCourse: bloc.inputCourse,
                        inputCredit: bloc.inputCredit,
                        selectedValue: bloc.dropdownValue,
                        addCourse: () {
                          final newCourse = CourseModel(
                            course: bloc.inputCourse.text,
                            grade: bloc.dropdownValue,
                            houres: int.parse(bloc.inputCredit.text),
                          );

                          bloc.add(AddCourseEvent(course: newCourse));
                          Navigator.of(context).pop();
                        },
                        onChanged: (value) {
                          if (value != null) {
                            bloc.add(DropdownEvent(value: value));
                          }
                        },
                      ),
                );
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
