import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculater/bloc/gpa_bloc.dart';
import 'package:gpa_calculater/taskmodel.dart';
import 'package:gpa_calculater/theem/colors.dart';
// import 'package:gpa_calculater/widget/add_subject_bottom.dart';

class GpaCalculaterScreen extends StatelessWidget {
  GpaCalculaterScreen({super.key});

  TextEditingController Coursecontroller = TextEditingController();
  TextEditingController hourcontroller = TextEditingController();
  String? SelectedGrade;
  List<String> grades = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpaBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<GpaBloc>();
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Text("GPA", style: TextStyle(fontSize: 40)),
                        SizedBox(height: 12),
                        BlocBuilder<GpaBloc, GpaState>(
                          builder: (context, state) {
                            if (state is addstate) {
                              return Text(
                                state.calculateGPA.toString(),
                                style: TextStyle(fontSize: 20),
                              );
                            } else if (state is deletestate) {
                              return Text(
                                state.calculateGPA.toString(),
                                style: TextStyle(fontSize: 20),
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                        SizedBox(height: 12),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Text("Add New Subject:"),
                                        SizedBox(height: 20),
                                        TextField(
                                          controller: Coursecontroller,
                                          decoration: InputDecoration(
                                            hintText: "Subject Name",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          controller: hourcontroller,
                                          decoration: InputDecoration(
                                            hintText: "Hours",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          items:
                                              grades.map((grade) {
                                                return DropdownMenuItem(
                                                  value: grade,
                                                  child: Text(grade),
                                                );
                                              }).toList(),
                                          onChanged: (value) {
                                            SelectedGrade = value;
                                          },
                                        ),

                                        ElevatedButton(
                                          onPressed: () {
                                            final courses = Taskmodel(
                                              CourseName:
                                                  Coursecontroller.text.trim(),
                                              hours: hourcontroller.text.trim(),
                                              grade: SelectedGrade!,
                                              onDelete: () {},
                                              onEdit: () {},
                                            );
                                            bloc.add(addsubject(task: courses));
                                          },
                                          child: Text("Calculate"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              " + ADD Subject:",
                              style: TextStyle(
                                fontSize: 18,
                                color: myAppColor.greencolor,
                              ),
                            ),
                          ),
                        ),

                        Divider(),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Text("Courses", style: TextStyle(fontSize: 20)),
                            SizedBox(width: 50),
                            Text("Hours", style: TextStyle(fontSize: 20)),
                            SizedBox(width: 30),
                            Text("Grade", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 30),
                        BlocBuilder<GpaBloc, GpaState>(
                          builder: (context2, state) {
                            if (state is addstate) {
                              return Column(
                                children:
                                    state.tasks
                                        .map(
                                          (item) => Taskmodel(
                                            CourseName: item.CourseName,
                                            hours: item.hours,
                                            grade: item.grade,
                                            onDelete: () {
                                              bloc.add(
                                                deletesubject(task: item),
                                              );
                                            },
                                            onEdit: () {
                                              final coursenameeditcontoller =
                                                  TextEditingController(
                                                    text: item.CourseName,
                                                  );
                                              final hourseedittcontroller =
                                                  TextEditingController(
                                                    text: item.hours,
                                                  );
                                              String selectgrade = item.grade;
                                              showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return AlertDialog(
                                                    title: Text("Edit"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              coursenameeditcontoller,
                                                          decoration:
                                                              InputDecoration(
                                                                labelText:
                                                                    "CoursName",
                                                              ),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              hourseedittcontroller,
                                                          decoration:
                                                              InputDecoration(
                                                                labelText:
                                                                    "hour",
                                                              ),
                                                        ),
                                                        DropdownButton<String>(
                                                          value: selectgrade,
                                                          isExpanded: true,
                                                          items:
                                                              grades.map((
                                                                grade,
                                                              ) {
                                                                return DropdownMenuItem(
                                                                  value: grade,
                                                                  child: Text(
                                                                    grade,
                                                                  ),
                                                                );
                                                              }).toList(),
                                                          onChanged: (value) {
                                                            selectgrade =
                                                                value!;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                          bloc.add(
                                                            editsubject(
                                                              oldtask: item,
                                                              updatetask: Taskmodel(
                                                                CourseName:
                                                                    coursenameeditcontoller
                                                                        .text,
                                                                hours:
                                                                    hourseedittcontroller
                                                                        .text,
                                                                grade:
                                                                    selectgrade,
                                                                onDelete: () {},
                                                                onEdit: () {},
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Text("Edit"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        )
                                        .toList(),
                              );
                            } else if (state is deletestate) {
                              return Column(
                                children:
                                    state.tasks
                                        .map(
                                          (item) => Taskmodel(
                                            CourseName: item.CourseName,
                                            hours: item.hours,
                                            grade: item.grade,
                                            onDelete: () {
                                              bloc.add(
                                                deletesubject(task: item),
                                              );
                                            },
                                            onEdit: () {},
                                          ),
                                        )
                                        .toList(),
                              );
                            } 

                            return Text("Nothing yet");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
