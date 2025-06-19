import 'package:flutter/material.dart';

class GpaWidget extends StatelessWidget {
  const GpaWidget({
    super.key,
    this.onDone,
    this.onDelete,
    required this.name,
    required this.hours,
    required this.grade,
  });
  final Function(bool?)? onDone;
  final Function()? onDelete;
  final String name;
  final String hours;
  final String grade;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Course name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(name),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  children: [
                    Text(
                      "Course grade",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(grade),
                  ],
                ),
                SizedBox(width: 24),

                Column(
                  children: [
                    Text(
                      "Course hours",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(hours),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
