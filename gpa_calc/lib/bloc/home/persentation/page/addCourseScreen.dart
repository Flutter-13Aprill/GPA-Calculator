import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calc/bloc/home/data/gpa_model.dart';
import 'package:gpa_calc/bloc/home_bloc.dart';
import 'package:gpa_calc/bloc/home_event.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String hours = '';
  String? grade;

  final grades = ['A', 'B', 'C', 'D', 'F'];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add Course')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // اسم المقرر
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Course Name'),
                    onChanged: (val) => name = val,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'ادخل اسم المقرر';
                      }
                      return null;
                    },
                  ),

                  // عدد الساعات
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Hours'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => hours = val,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'ادخل عدد الساعات';
                      }
                      if (int.tryParse(val) == null) {
                        return 'عدد الساعات يجب أن يكون رقماً';
                      }
                      return null;
                    },
                  ),

                  // التقدير
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Grade'),
                    value: grade,
                    items:
                        grades
                            .map(
                              (g) => DropdownMenuItem(value: g, child: Text(g)),
                            )
                            .toList(),
                    onChanged: (val) => setState(() => grade = val),
                    validator: (val) {
                      if (val == null) {
                        return 'اختر التقدير';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // زر الإضافة
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final course = GpaModel(
                          name: name,
                          hourse: int.parse(hours),
                          grade: grade!,
                        );

                        context.read<HomeBloc>().add(AddCourse(course));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
