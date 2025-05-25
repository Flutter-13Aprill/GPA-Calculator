import 'package:flutter/material.dart';
import 'package:gpa_calculator/home/extensions/screens/get_size_screen.dart';
import 'package:gpa_calculator/style/style_color.dart';

class ButtomWidget extends StatelessWidget {
  /// A custom styled elevated button widget.
  ///
  /// Takes a callback for tap events and a label text to display.
  /// The button size adapts based on screen dimensions.
  const ButtomWidget({
    super.key,
    required this.onTab,
    required this.textElevatedButton,
  });
  final void Function()? onTab;
  final String textElevatedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(StyleColor.green),
        alignment: Alignment.center,
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(context.getWidth() + 200, context.getHeight() / 20),
        ),
      ),
      onPressed: onTab,
      child: Center(
        child: Text(
          textElevatedButton,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
