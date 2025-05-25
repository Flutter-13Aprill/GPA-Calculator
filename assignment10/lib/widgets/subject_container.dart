import 'package:assignment10/extensions/sizes.dart';
import 'package:flutter/material.dart';

class SubjectContainer extends StatelessWidget {
  const SubjectContainer({super.key,this.onChanged, this.currentValue, required this.subject, required this.hours});

 final Function(String?)? onChanged;
  final String? currentValue;
  final TextEditingController subject;
    final TextEditingController hours;

  @override
  Widget build(BuildContext context) {
    GlobalKey formKey = GlobalKey();
    return Container(height: context.getHeight()*0.05,
      child: Form(key: formKey,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 16,
          children: [
            Container(
              width: 100,
              height: 50,
              child: DropdownButton(hint: Text('Grade'),
              value: currentValue,
                items: [
                  DropdownMenuItem<String>(value: 'A+',child: Text('A+'),),
                  DropdownMenuItem<String>(value: 'A',child: Text('A'),),
                  DropdownMenuItem<String>(value: 'B+',child: Text('B+'),),
                  DropdownMenuItem<String>(value: 'B',child: Text('B'),),
                  DropdownMenuItem<String>(value: 'C+',child: Text('C+'),),
                  DropdownMenuItem<String>(value: 'C',child: Text('C'),),
                  DropdownMenuItem<String>(value: 'D+',child: Text('D+'),),
                  DropdownMenuItem<String>(value: 'D',child: Text('D'),),
                  DropdownMenuItem<String>(value: 'F',child: Text('F'),),
                ],
                onChanged: onChanged,
              ),
            ),
      
            Container(
              width: 50,
              height: 50,
              child: TextFormField(controller: hours,
                decoration: InputDecoration(hintText: 'Hours'),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              child: TextFormField(controller: subject,
                decoration: InputDecoration(hintText: 'Subject Name'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
