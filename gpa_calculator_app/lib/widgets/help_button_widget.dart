import 'package:flutter/material.dart';
import 'package:gpa_calculator_app/style/app_color.dart';
import 'package:gpa_calculator_app/utils/extensions/screen/screen_size.dart';

class HelpButtonWidget extends StatelessWidget {
  const HelpButtonWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  // This widget represents a circular "Help" button with a question mark icon and text.
  // When tapped, it move the user to a help chat or support screen.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.getHeight(factor: 0.095),
        width: context.getWidth(factor: 0.3),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(2, 2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.question_mark_outlined,
              size: 30,
              color: AppColors.pinkDark,
            ),
            SizedBox(height: 5),
            Text("need help?"),
          ],
        ),
      ),
    );
  }
}
