import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../gpa/bloc/gpa_bloc.dart';
import '../gpa/model/course_model.dart';
import '../gpa/widgets/add_edit_course_screen.dart';

class GpaScreen extends StatelessWidget {
  const GpaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPA Calculator'), centerTitle: true),
      body: BlocBuilder<GpaBloc, GpaState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 16),
              Text(
                'GPA: ${state.gpa.toStringAsFixed(2)}',//Convert the number to two decimal places
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    final course = state.courses[index];
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text(
                        'Grade: ${course.grade} | Hours: ${course.creditHours}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => AddEditCourseScreen(
                                  course: course,
                                  index: index,
                                ),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<GpaBloc>().add(DeleteCourse(index)); //pressed send the event to delet course 
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context2) => BlocProvider.value( //Sends the same copy to the new page.
                    value: BlocProvider.of<GpaBloc>(context), //Takes the currently running version of GpaBloc in GpaScreen.
                    child: const AddEditCourseScreen(),//For the new page that needs to deal with the same data
                   
                  ),
            ),
          );
        },
      ),
    );
  }
}
