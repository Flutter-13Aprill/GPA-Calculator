import 'package:flutter/material.dart';

class HomeScreenCustomTextField extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;
  const HomeScreenCustomTextField({
    super.key,
    required this.textHint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: textHint,
        hintStyle: TextStyle(color: Colors.white),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "The field is empty";
        }

        return null;
      },
    );
  }
}
