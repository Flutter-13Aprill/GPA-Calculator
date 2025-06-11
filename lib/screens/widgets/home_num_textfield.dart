import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenCustomNumberTextField extends StatelessWidget {
  final String textHint;
  final TextEditingController controller;
  HomeScreenCustomNumberTextField({
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
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "The Field is empty";
        } else if (int.parse(value) == 0) {
          return "Please enter a number larger than 0";
        } else {
          return null;
        }
      },
    );
  }
}
