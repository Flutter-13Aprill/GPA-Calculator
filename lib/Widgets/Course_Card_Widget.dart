import 'package:flutter/material.dart';
import 'package:gpa_calculator/models/course_model.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  
  const CourseCard({
    super.key,
    required this.course,
    required this.onEdit,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      // Outer card styling with margin, rounded corners, and shadow
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Circle avatar showing the course grade with a light background
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.blueAccent.withOpacity(0.15),
              child: Text(
                course.grade,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),

            const SizedBox(width: 20),

            // Expanded column showing course name, credit, and grade point
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Display credit hours in smaller, grey text
                  Text(
                    "Credit Hours: ${course.credit}",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ],
              ),
            ),
            // Edit button triggers onEdit callback
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.green),
              onPressed: onEdit,
              tooltip: "Edit course",
            ),

            // Delete button triggers onDelete callback
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
              tooltip: "Delete course",
            ),
          ],
        ),
      ),
    );
  }
}
