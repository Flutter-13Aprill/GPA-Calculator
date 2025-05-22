import 'package:flutter/material.dart';

// -- App Theming
import 'package:gpa_calculator/theming/app_colors.dart';

// -- Utilities (Extensions)
import 'package:gpa_calculator/utilities/screen/extensions/screen_size.dart';

class CustomButtonWidget extends StatelessWidget {

  /// [CustomButtonWidget] A reusable button widget used throughout the app.
  const CustomButtonWidget({super.key, required this.label, required this.onTap});

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: context.getWidth(),
        height: context.getHeight(multiplied: 0.06),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.primaryColor,
        ),
        child: Text(label,  style: Theme.of(context).textTheme.bodyMedium!.copyWith( color: AppColors.secondaryColor),)
      ),
    );
  }
}
