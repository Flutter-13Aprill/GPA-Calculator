import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget({super.key, this.onChanged, required this.value});
  final Function(String)? onChanged;
  final String? value;

  static const Map<String, double> items = {
    'A+': 5.0,
    'A': 4.75,
    'B+': 4.5,
    'B': 4.0,
    'C+': 3.5,
    'C': 3.0,
    'D': 2.5,
    'D+': 2.0,
    'F': 0.0,
  };

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Course Grade',
            style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
          ),
          items:
              DropdownWidget.items.keys
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: const TextStyle(fontSize: 14)),
                    ),
                  )
                  .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });

            if (widget.onChanged != null && value != null) {
              widget.onChanged!(value);
            }
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
        ),
      ),
    );
  }
}
