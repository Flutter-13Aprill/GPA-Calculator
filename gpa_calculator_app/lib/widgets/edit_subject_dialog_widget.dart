import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator_app/models/gpaـcalculator_model.dart';
import 'package:gpa_calculator_app/screens/home/bloc/gpa_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gpa_calculator_app/style/app_color.dart';
import 'package:gpa_calculator_app/utils/extensions/screen/screen_size.dart';

class EditSubjectDialogWidget extends StatelessWidget {
  final int index;
  final GpaBloc bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EditSubjectDialogWidget({super.key, required this.index, required this.bloc});
  // This widget displays a styled dialog for editing a subject's name, hours, and grade.
  // It uses the same design and layout as the AddSubjectDialogWidget for UI consistency.

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Edit Subject"),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: SizedBox(
        height: context.getHeight(factor: 0.25),
        width: context.getWidth(factor: 0.9),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: bloc.subjectController,
                    decoration: InputDecoration(
                      hintText: 'Subject Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                    ),
                    validator:
                        (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: bloc.hoursController,
                          decoration: InputDecoration(
                            hintText: 'Subject Hour',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                            if (double.tryParse(value) == null) {
                              return "Numbers only";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 0,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: BlocBuilder<GpaBloc, GpaState>(
                              builder: (context, state) {
                                return DropdownButton2<double>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Grade',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  items:
                                      bloc.gradesMap.entries
                                          .map(
                                            (item) => DropdownMenuItem<double>(
                                              value: item.value,
                                              child: Text(item.key),
                                            ),
                                          )
                                          .toList(),
                                  value: bloc.selected,

                                  onChanged: (double? value) {
                                    if (value != null) {
                                      bloc.add(GradeSelected(selected: value));
                                    }
                                  },
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  buttonStyleData: const ButtonStyleData(
                                    height: 48,
                                    width: double.infinity,
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pinkDark,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final updated = GpaCalculatorModel(
                          subjectName: bloc.subjectController.text,
                          subjectHours: double.parse(bloc.hoursController.text),
                          subjectGrade: bloc.selected!,
                        );

                        bloc.add(
                          EditSubject(index: index, updatedSubject: updated),
                        );

                        Navigator.pop(context);
                        bloc.subjectController.clear();
                        bloc.hoursController.clear();
                        bloc.selected = null;
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
