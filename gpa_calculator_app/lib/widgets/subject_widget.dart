import 'package:flutter/material.dart';
import 'package:gpa_calculator_app/utils/extensions/screen/screen_size.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({
    super.key,
    required this.hours,
    required this.title,
    required this.grade,
    required this.onEdit,
    required this.onDelete,
  });

  final String title;
  final double hours;
  final double grade;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  // This widget represents subject in the GPA calculator app.
  // It displays the subject title, hours, and grade, along with edit and delete icons
  // to allow user interaction such as modifying or removing the subject.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: context.getHeight(factor: 0.08),
        width: context.getWidth(factor: 0.9),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: Offset(2, 2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Hours: ${hours.toString()} · Grade: $grade'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,

            children: [
              GestureDetector(
                onTap: onEdit,
                child: Icon(Icons.edit, color: Colors.blue[800]),
              ),
              SizedBox(width: 4),

              GestureDetector(
                onTap: onDelete,
                child: Icon(Icons.cancel_outlined, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
