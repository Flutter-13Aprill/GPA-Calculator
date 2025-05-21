import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

// define FormWidget
class FormWidget extends StatelessWidget {
  //define Controller for text feild
  final ControllerTextFeild;
  final String hintText; //define hintText for textfeild
  final String? Function(String?) validator; //define the function for validator

  //constractur to init the varibles
  FormWidget({
    super.key,
    required this.ControllerTextFeild,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container for displaying the input field.
      margin: EdgeInsets.only(bottom: 12), // Adds bottom margin for spacing.
      width: context.getWight(), // Sets the width to the full screen width.
      height:
          context.getHight() *
          .08, // Sets the height to 8% of the screen height.

      child: ListTile(
        // A list tile to organize the title and the text form field.
        title: Text(hintText),// Displays the hint text as the title.
        subtitle: TextFormField(// Displays the hint text as the title.
          controller: ControllerTextFeild,// Controls the text being edited.
          decoration: InputDecoration(
            hintText: hintText,// Placeholder text inside the input field.
            border: OutlineInputBorder(),// Defines the visual border of the input field.
          ),
          validator: validator,// Function to validate the input.
        ),
      ),
    );
  }
}


/** validator: (value) {
            if (hintText == "enter Course name") {
              if (value!.isEmpty || value == null) {
                return "Course name must not be Empty";
              }
            }
            if (hintText == "enter  Credit hours") {
              final isNumber = "^[0-9]";
              if (!value!.contains(RegExp(isNumber))) {
                return "redit hours must be a Number";
              }
            }
            return null;
          }, */