import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.hintText,
      required this.options,
      required this.onItemSelect});

  final String hintText;
  final List<String> options;
  final void Function(String) onItemSelect;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      borderRadius: BorderRadius.circular(12),
      isExpanded: true,
      alignment: FractionalOffset.topLeft,
      hint: Text(widget.hintText),
      onChanged: (String? newValue) {
        if (newValue != null && newValue.isNotEmpty) {
          setState(() {
            _selectedValue = newValue;
            widget.onItemSelect(newValue);

          });
        }
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
