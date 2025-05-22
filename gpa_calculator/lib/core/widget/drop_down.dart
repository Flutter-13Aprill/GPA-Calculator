import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/extensions/screen/screen_size.dart';
import 'package:gpa_calculator/core/theme/app_palette.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key, required this.fontsize, required this.label, required this.controller});
final double fontsize;
final Widget label;
final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    
    return DropdownMenu(textStyle:TextStyle(fontSize: fontsize,color: AppPalette.whiteColor),inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(context.getShortest(per: 0.1)),borderSide: BorderSide(color: AppPalette.whiteColor, width: 2),), labelStyle: TextStyle(color: AppPalette.whiteColor),),
                              label: label ,
                              
                                controller:controller ,
                                dropdownMenuEntries: [
                                  DropdownMenuEntry(value: 'A+', label: 'A+',),
                                 DropdownMenuEntry(value: 'A', label: 'A'),
                                 DropdownMenuEntry(value: 'B+', label: 'B+'),
                                 DropdownMenuEntry(value: 'B', label: 'B'),
                                 DropdownMenuEntry(value: 'C+', label: 'C+'),
                                 DropdownMenuEntry(value: 'C', label: 'C'),
                                 DropdownMenuEntry(value: 'D+', label: 'D+'),
                                 DropdownMenuEntry(value: 'D', label: 'D'),
                                 DropdownMenuEntry(value: 'F', label: 'F'),]
                              );
  }
}
