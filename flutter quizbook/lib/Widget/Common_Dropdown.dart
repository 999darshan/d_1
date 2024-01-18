import 'package:flutter/material.dart';
import 'package:quiz_2/Utils/Constanc.dart';

class CommonDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final String labelText;
  final String hintText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  CommonDropdown({
    required this.value,
    required this.items,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value.isEmpty ? null : value,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: BlackColor, fontWeight: FontWeight.w500, fontSize: 20),
        // Add other styling properties here if needed
      ),
      hint: Text(
        hintText,
        style: TextStyle(fontSize: 14, color: GreyColor),
      ),
      onChanged: onChanged,
      validator: validator,
      items: items
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 13),
              ),
            ),
          )
          .toList(),
    );
  }
}
