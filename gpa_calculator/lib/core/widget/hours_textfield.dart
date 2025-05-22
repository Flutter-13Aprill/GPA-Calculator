import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/widget/custom_text_field.dart';

class HoursTextfield extends StatelessWidget {
  const HoursTextfield({super.key, required this.textController});
final TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    
    return CustomTextField(text: 'Hours', controllers: textController,condition:(value) {
      int? hours =int.tryParse(value);
                        if(hours==null) {
                          return 'should be a number';
                        }else{
                          if(hours < 1 ){
                               textController.text = '1';
                          }
                          if(hours > 9 ){
                            return 'hours should be between 1 - 9';
                          }
                          }
                        
                       return null;
                      } );
  }
}