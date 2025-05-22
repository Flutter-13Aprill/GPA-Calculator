import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/widget/custom_text_field.dart';

class CoursnameTextfield extends StatelessWidget {
  const CoursnameTextfield({super.key,required this.textController});
final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    
    return CustomTextField(text: 'Course Name', controllers: textController,condition: (value) {
                        if (value.isEmpty || value == null){
                          return 'Required';
                        }else if(value.length < 3){
                          return'Should be 3 Character at least';
                        }
                        return null;
                       });
  }
}