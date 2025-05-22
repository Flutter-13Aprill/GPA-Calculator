import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/extensions/screen/screen_size.dart';
import 'package:gpa_calculator/core/theme/app_palette.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, required this.controllers, this.condition});
  final String text;
  final TextEditingController controllers ;
  final FormFieldValidator? condition ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(style: TextStyle(color: AppPalette.whiteColor),controller: controllers ,decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(context.getShortest(per: 0.1)),borderSide: BorderSide(color: AppPalette.whiteColor, width: 2)),hintStyle: TextStyle(color: AppPalette.whiteColor),hintText: text),validator: condition,);
  }
}

