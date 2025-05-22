import 'package:flutter/material.dart';

// -- App Theming
import 'package:gpa_calculator/theming/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  /// [CustomTextFormField] A reusable text form field widget used across the app.
  const CustomTextFormField({super.key, required this.controller, required this.labelText, this.isHours = false ,this.onValidate});

  final TextEditingController controller;
  final String labelText;
  final String? Function(String? value)? onValidate;
  final bool isHours;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidate,
      cursorHeight: 12,
      cursorColor: AppColors.primaryColor,
      controller: controller,
      keyboardType: isHours ? TextInputType.number : TextInputType.name ,
      decoration: InputDecoration(
        hintText: labelText,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
