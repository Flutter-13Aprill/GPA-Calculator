import 'package:flutter/material.dart';

class GradeDropdown extends StatelessWidget {
  final String value;
  final void Function(String) onChanged;

  const GradeDropdown({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final grades = ['A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];

    return DropdownButtonFormField<String>(
      value: value,
      items: grades
          .map((grade) => DropdownMenuItem(value: grade, child: Text(grade)))
          .toList(),
      onChanged: (val) => onChanged(val!),
      decoration: const InputDecoration(labelText: 'Grade'),
    );
  }
}
