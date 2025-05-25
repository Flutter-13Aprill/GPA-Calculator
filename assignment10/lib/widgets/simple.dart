import 'package:flutter/material.dart';

class Simple extends StatelessWidget {
  const Simple({super.key,required this.setSubjectName,required this.setHours,required this.setGrade});


  final TextEditingController setSubjectName;
  final TextEditingController setHours;
  final String setGrade;
  @override
  Widget build(BuildContext context) {
    return  Container(width: 300,height: 50,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Subject: ${setSubjectName!.text}'), Text('Hours :${setHours.text}'), Text('Grade: $setGrade')],
        ),
      );

  }
}
