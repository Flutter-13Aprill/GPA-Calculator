import 'package:flutter/material.dart';

// -- Widgets
import 'package:gpa_calculator/widgets/edit_course_widget.dart';
import 'package:gpa_calculator/widgets/course_widget.dart';
import 'package:gpa_calculator/widgets/course_bottom_sheet_widget.dart';

// - BLoC
import 'package:gpa_calculator/screens/home/bloc/gap_calculator_bloc.dart';

// -- Model
import 'package:gpa_calculator/models/course_model.dart';


class CourseDismissibleWidget extends StatelessWidget {

  /// [CourseDismissibleWidget] It's an element that display course details and also you could delete from the list view
  const CourseDismissibleWidget({super.key, required this.courses, required this.index, required this.gapBloc});

  final List<CourseModel> courses; 
  final int index;
  final GapCalculatorBloc gapBloc;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(courses[index].id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.red,
        child: Row(
          children: [
            Spacer(),
            Icon(Icons.delete, color: Colors.white, size: 28),
          ],
        ),
      ),
      onDismissed: (direction) {
        gapBloc.add(DeleteCourseEvent(index: index));
      },
      child: InkWell(
        onTap: () {
          courseBottomSheetWidget(
            context: context,
            child: EditCourseWidget(gapBloc: gapBloc, course: courses[index],index: index,),
            gapBloc: gapBloc,
          );
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: CourseWidget(course: courses[index]),
        ),
      ),
    );
  }
}