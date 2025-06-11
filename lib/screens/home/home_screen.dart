import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/screens/collections/lists.dart';
import 'package:gpa_calculator/screens/home/bloc/home_bloc.dart';
import 'package:gpa_calculator/screens/widgets/custom_listtile.dart';
import 'package:gpa_calculator/screens/widgets/home_num_textfield.dart';
import 'package:gpa_calculator/screens/widgets/home_text_textfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String? gradeValue;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),

      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBloc>();
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 100,
              leading: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (bloc.courses.isNotEmpty) {
                    return Center(
                      child: Text("Total GPA: ${bloc.gpa.toStringAsFixed(2)}"),
                    );
                  } else {
                    return Text("Total GPA: 0");
                  }
                },
              ),
              centerTitle: true,
              title: Text("GPA Calculator"),
              actions: [
                TextButton(
                  onPressed: () {
                    bloc.add(DisplayGpaEvent());
                  },
                  child: Text("Calculate GPA"),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Form(
                        key: bloc.formKey,
                        child: Column(
                          spacing: 6,
                          children: [
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black,
                                ),
                                child: HomeScreenCustomTextField(
                                  textHint: '  Subject Name',
                                  controller: bloc.subjectNameController,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black,
                                ),
                                child: HomeScreenCustomNumberTextField(
                                  textHint: '  Subject Hours',
                                  controller: bloc.subjectHoursController,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.black),
                                child: DropdownMenu(
                                  textStyle: TextStyle(color: Colors.white),
                                  controller: bloc.subjectGradeController,
                                  hintText: "Select a Grade",
                                  dropdownMenuEntries: gradesList,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                bloc.formKey.currentState!.validate();
                                bloc.add(AddItemEvent());
                              },
                              child: Text("Add Course"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (bloc.courses.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bloc.courses.length,
                            itemBuilder:
                                (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child:
                                    // Display the courses
                                    CustomListTile(index: index, bloc: bloc),
                                  ),
                                ),
                          ),
                        );
                      }
                      return SizedBox(child: Text("Empty"));
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
