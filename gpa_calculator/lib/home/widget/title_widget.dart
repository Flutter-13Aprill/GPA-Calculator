import 'package:flutter/material.dart';
import 'package:gpa_calculator/style/style_color.dart';

class TitleWidget extends StatelessWidget {
  /// A simple widget that displays a greeting title.
  ///
  /// Shows "Hi" and "Let's check your GPA!" texts styled with custom colors and padding.
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),

      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: StyleColor.white,
              ),
            ),
            Text(
              'Let\'s check your GPA!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: StyleColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
