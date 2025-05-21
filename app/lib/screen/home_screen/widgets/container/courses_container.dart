import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
/// A widget that displays course information in a container.

class Coursescontainer extends StatelessWidget {


 const Coursescontainer({
    super.key,
    required this.coursesNmae,
    required this.creditHours,
    required this.grade,
    this.onDelete,
    this.onChane,
  });
  //define varibles of widgetds 
  final String coursesNmae;
  final String creditHours;
  final double grade;
  final Function()? onDelete;
  final Function()? onChane;

  @override
  Widget build(BuildContext context) {
    return Container(//Container to dispaly courses 
      margin: EdgeInsets.only(top: 8, bottom: 2),//add margin 
      width: context.getWight(),//define width & height
      height: context.getHight() * .2,
      color: Colors.blueGrey,//color it 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          //display values of courseses 
          Text(
            "courses Nmae : $coursesNmae",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("credit Hours : $creditHours", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text("grade : $grade", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Row(
            //dispaly 2 buttons for edit and close 
            children: [
              IconButton(onPressed: onChane, icon: Icon(Icons.edit)),
              IconButton(onPressed: onDelete, icon: Icon(Icons.close)),
            ],
          ),
        ],
      ),
    );
  }
}
