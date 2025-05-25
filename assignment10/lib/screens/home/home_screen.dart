import 'package:assignment10/extensions/sizes.dart';
import 'package:assignment10/screens/home/bloc/subjects_bloc.dart';
import 'package:assignment10/widgets/simple.dart';
import 'package:assignment10/widgets/subject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController subjectName = TextEditingController();
    TextEditingController hoursController = TextEditingController();

    return BlocProvider(
      create: (context) => SubjectsBloc(),

      child: BlocBuilder<SubjectsBloc, SubjectsState>(
        builder: (context, state) {
          final bloc = context.read<SubjectsBloc>();
          return Scaffold(
            body: Center(
              child: Container(
                width: context.getWidth() * 0.9,
                height: context.getHeight() * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<SubjectsBloc, SubjectsState>(
                      builder: (context, state) {
                        final bloc = context.read<SubjectsBloc>();
                        return Container(
                          height: context.getHeight() * 0.05,
                          child: SubjectContainer(
                            subject: subjectName,
                            hours: hoursController,
                            currentValue: bloc.currentvalue,
                            onChanged: (p0) {
                              {
                                bloc.currentvalue = p0!;
                                bloc.add(SelectedGrade(p0));

                                print(state);
                              }
                            },
                          ),
                        );
                        // return Text('data');
                      },
                    ),

                    ElevatedButton(
                      onPressed: () {
                        bloc.add(
                          CalculateEvent(
                            simpleContainer: Simple(
                              setGrade: bloc.currentvalue,
                              setHours: hoursController,
                              setSubjectName: subjectName,
                            ),
                          ),
                        );
                     },
                      child: Text('Submit'),
                    ),
                    Container(height: 200,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...bloc.grade,
                        
                          
                          ],
                        ),
                      ),
                    ),
                      if(state is SuccessStateGrade)
                          Text(
                            'Your totale grade is: ${state.value.toString()}',
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
