import 'package:flutter/material.dart';

class TermsAndConditionCheckbox extends StatefulWidget {
   TermsAndConditionCheckbox({super.key, required this.onTap});

   final Function(bool) onTap;

  @override
  State<TermsAndConditionCheckbox> createState() =>
      _TermsAndConditionCheckboxState();
}

class _TermsAndConditionCheckboxState extends State<TermsAndConditionCheckbox> {
    bool isChecked = false;

   @override
  void initState() {
    // TODO: implement initState
    isChecked = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        setState(
          () {
            isChecked = value ?? false;
          },
        );
          widget.onTap(isChecked);
      },
    );
  }
}
