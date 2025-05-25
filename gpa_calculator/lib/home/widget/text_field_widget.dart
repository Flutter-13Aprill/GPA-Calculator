import 'package:flutter/material.dart';
import 'package:gpa_calculator/style/style_color.dart';

class TextFieldWidget extends StatelessWidget {
  /// A customizable text field widget with validation support.
  ///
  /// Wraps a [TextFormField] with styling and optional validator,
  /// using provided controller, label, and hint text.
  const TextFieldWidget({
    super.key,
    required this.input,
    this.validare,
    required this.labelText,
    required this.hintText,
  });
  final TextEditingController input;
  final String? Function(String?)? validare;
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input,
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleColor.white,
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        errorStyle: TextStyle(color: Colors.red),
      ),
      validator: validare,
    );
  }
}
