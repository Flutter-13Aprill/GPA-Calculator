import 'package:flutter/material.dart';
import 'package:gpa_calculator/screens/home/bloc/home_bloc.dart';

class CustomListTile extends StatelessWidget {
  final int index;
  void add() {}
  final HomeBloc bloc;
  const CustomListTile({super.key, required this.index, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          bloc.courses.removeAt(index);
          bloc.add(RemoveItemEvent());
        },
        icon: Icon(Icons.highlight_remove, color: Colors.red, size: 25,),
      ),
      title: Text(
        bloc.courses[index]["course"],
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "Hours: ${bloc.courses[index]["hours"].toString()}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SizedBox(
        width: 100,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              bloc.courses[index]["grade"],
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(width: 16),

            // Overwrite the map "courses"
            IconButton(
              onPressed: () {
                bloc.courses[index]["course"] = bloc.subjectNameController.text;
                bloc.courses[index]["hours"] = int.parse(
                  bloc.subjectHoursController.text,
                );
                bloc.courses[index]["grade"] = bloc.subjectGradeController.text;
                bloc.add(EditItemEvent());
              },
              icon: Icon(Icons.edit, color: Colors.grey,size: 25,),
            ),
          ],
        ),
      ),
    );
  }
}
