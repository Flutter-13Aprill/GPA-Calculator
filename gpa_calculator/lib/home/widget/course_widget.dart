import 'package:flutter/material.dart';
import 'package:gpa_calculator/style/style_color.dart';

class CourseWidget extends StatelessWidget {
  /// A widget that displays course information in a styled list tile.
  ///
  /// Shows the course name and details, with optional edit and delete buttons.
  const CourseWidget({
    super.key,
    required this.courseName,
    required this.courseDetails,
    this.onEdit,
    this.ondelete,
  });
  final String courseName;
  final String courseDetails;
  final Function()? onEdit;
  final Function()? ondelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

      tileColor: StyleColor.white,
      leading: IconButton(
        onPressed: onEdit,
        icon: Icon(Icons.edit_note_rounded, size: 30),
      ),
      title: Text(courseName),
      subtitle: Text(courseDetails),
      trailing: IconButton(onPressed: ondelete, icon: Icon(Icons.delete)),
    );
  }
}
