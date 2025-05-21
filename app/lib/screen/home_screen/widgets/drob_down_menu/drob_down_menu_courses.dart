import 'package:flutter/material.dart';


class GradeDropdown extends StatelessWidget {
  
double chooseGrade(String value) {
  double grade = 0.0;
  switch (value) {
    case "A+":
      grade = 5.0;
      break;
    case "A":
      grade = 4.75;
      break;
    case "B+":
      grade = 4.5;
      break;
    case "B":
      grade = 4.0;
      break;
    case "C+":
      grade = 3.5;
      break;
    case "C":
      grade = 3.0;
      break;
    case "D+":
      grade = 2.5;
      break;
    case "D":
      grade = 2.0;
      break;
    default:
      grade = 0.0;
      break;
  }
  return grade;
}

String getGradeString(double value) {
  if (value == 5.0) return "A+";
  if (value == 4.75) return "A";
  if (value == 4.5) return "B+";
  if (value == 4.0) return "B";
  if (value == 3.5) return "C+";
  if (value == 3.0) return "C";
  if (value == 2.5) return "D+";
  if (value == 2.0) return "D";
  return ""; // Default for unexpected values, though ideally all values should map.
}
  const GradeDropdown({
    super.key,
    required this.onChanged, 
    this.initialGradeValue 
  });

//define varibles  
  final ValueChanged<double> onChanged;//onChanged  for change value 
  final double? initialGradeValue;//initial value for drob Down Menu

  @override
  Widget build(BuildContext context) {
    //set the value initialGradeValue if its not null 
     String? initialSelection;
    if (initialGradeValue != null) {
      initialSelection = getGradeString(initialGradeValue!);//call getGradeString
    }

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch,  //take all space 
      children: [
        const Text(
          "Choose your Grade",//dispaly text and give it style 
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8), // space
        DropdownMenu<String>(//drob down for student grade to chosse from it 
          initialSelection: initialSelection,
          dropdownMenuEntries: const [
            DropdownMenuEntry(label: "A+", value: "A+"),
            DropdownMenuEntry(label: "A", value: "A"),
            DropdownMenuEntry(label: "B+", value: "B+"),
            DropdownMenuEntry(label: "B", value: "B"),
            DropdownMenuEntry(label: "C+", value: "C+"),
            DropdownMenuEntry(label: "C", value: "C"),
            DropdownMenuEntry(label: "D+", value: "D+"),
            DropdownMenuEntry(label: "D", value: "D"),
          ],
          onSelected: (value) {//if value not null do 
            if (value != null) {
              //pass vlaue onChanged when calling it 
               onChanged(chooseGrade(value));
            }
          },
        ),
      ],
    );
  }
}
