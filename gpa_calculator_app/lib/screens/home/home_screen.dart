import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator_app/screens/home/bloc/gpa_bloc.dart';
import 'package:gpa_calculator_app/style/app_color.dart';
import 'package:gpa_calculator_app/widgets/add_subject_dialog_widget.dart';
import 'package:gpa_calculator_app/widgets/edit_subject_dialog_widget.dart';
import 'package:gpa_calculator_app/widgets/help_button_widget.dart';
import 'package:gpa_calculator_app/widgets/subject_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpaBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<GpaBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "GPA Calculator",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,

                    colors: [AppColors.pinkLight, AppColors.pinkDark],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(top: 72),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,

                    builder:
                        (dialogContext) => BlocProvider.value(
                          value: bloc,
                          child: AddSubjectDialogWidget(bloc: bloc),
                        ),
                  );
                },
                child: Icon(Icons.add, color: AppColors.pinkDark),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 64,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: BlocBuilder<GpaBloc, GpaState>(
                        builder: (context, state) {
                          if (state is SuccessState) {
                            return ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                ...state.grades.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final item = entry.value;
                                  return SubjectWidget(
                                    title: item.subjectName,
                                    hours: item.subjectHours,
                                    grade: item.subjectGrade,

                                    onDelete: () {
                                      context.read<GpaBloc>().add(
                                        DeleteSubject(index: index),
                                      );
                                    },
                                    onEdit: () {
                                      bloc.subjectController.text =
                                          item.subjectName;
                                      bloc.hoursController.text =
                                          item.subjectHours.toString();
                                      bloc.selected = item.subjectGrade;

                                      showDialog(
                                        context: context,
                                        builder:
                                            (_) => BlocProvider.value(
                                              value: bloc,
                                              child: EditSubjectDialogWidget(
                                                index: index,
                                                bloc: bloc,
                                              ),
                                            ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            );
                          } else {
                            return Center(child: Text("No subjects added yet"));
                          }
                        },
                      ),
                    ),

                    BlocBuilder<GpaBloc, GpaState>(
                      builder: (context, state) {
                        if (state is SuccessState) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "GPA: ${state.gpa.toStringAsFixed(2)}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              HelpButtonWidget(),
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
