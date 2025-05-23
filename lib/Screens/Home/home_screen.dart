import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpabloc/CustomWidgets/add_course_dialog.dart';
import 'package:gpabloc/CustomWidgets/course_tile.dart';
import 'package:gpabloc/CustomWidgets/edit_course_dialog.dart';
import 'package:gpabloc/Models/course_model.dart';
import 'package:gpabloc/Screens/Home/bloc/home_bloc.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (listenerContext, state) {
          if (state is ShowAddCourseDialog) {
            showDialog(
              context: listenerContext,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<HomeBloc>(listenerContext),
                  child: AddCourseDialog(listenerContext: listenerContext),
                );
              },
            );
          }
          if (state is EditCourseDialogShown) {
            showDialog(
              context: listenerContext,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<HomeBloc>(listenerContext),
                  child: EditCourseDialog(
                    course: state.course,
                    index: state.index,
                  ),
                );
              },
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('GPA Calculator'),
            actions: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (builderContext, state) {
                  return IconButton(
                    onPressed: () {
                      builderContext.read<HomeBloc>().add(
                        ShowAddCourseDialogEvent(),
                      );
                    },
                    icon: Icon(Icons.add),
                  );
                },
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    var bloc = context.read<HomeBloc>();
                    List<CourseModel> courses = bloc.courses;
                    return ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            onDismissed: (direction) {
                              context.read<HomeBloc>().add(
                                DeleteCourseEvent(index),
                              );
                            },
                            key: Key(courses[index].courseName),
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,

                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.delete),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                bloc.add(
                                  ShowEditCourseDialogEvent(
                                    course: courses[index],
                                    index: index,
                                  ),
                                );
                              },
                              child: CourseTile(course: courses[index]),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(32.0),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: DashedBorder.fromBorderSide(
                        side: BorderSide(color: Colors.lightGreen[200]!),
                        dashLength: 10,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GPA: ${context.read<HomeBloc>().gpa.toStringAsFixed(2)}  Total Credits: ${context.read<HomeBloc>().totalCredits}",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
