import 'package:flutter/material.dart';
import 'package:gpa_calculater/extention/extention.dart';
import 'package:gpa_calculater/theem/colors.dart';

class Taskmodel extends StatelessWidget {
  final String CourseName;
  final String hours;
  final String grade;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const Taskmodel({
    super.key,
    required this.CourseName,
    required this.hours,
    required this.grade,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: Row(
        children: [
          Icon(Icons.book, color: myAppColor.greencolor),
          SizedBox(width: 7),
          Expanded(
            flex: 5,
            child: Text(CourseName, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(width: 20),
          Expanded(flex: 1, child: Text(hours, style: TextStyle(fontSize: 20))),
          SizedBox(width: 60),
          Expanded(flex: 2, child: Text(grade, style: TextStyle(fontSize: 20))),
          SizedBox(width: 10),
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit, color: myAppColor.greencolor),
          ),
          IconButton(
            onPressed: onDelete,

            icon: Icon(Icons.close, color: myAppColor.redcolor),
          ),
        ],
      ),
    );
  }
}
