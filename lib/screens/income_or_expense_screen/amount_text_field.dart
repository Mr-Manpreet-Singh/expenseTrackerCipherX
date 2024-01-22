import 'package:expense_tracker_app/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  AmountTextField({super.key, required this.enteredAmount});

  final void Function(double) enteredAmount;
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    
    final TextStyle customStyle = CustomTextStyles.customStyle(
      color: const Color(0xFFFBFBFB),
      fontSize: 64,
      fontWeight: FontWeight.w600,
    );

    return TextField(
      onChanged: (_) {
        final input = _controller.text.trim();
        final amount = double.tryParse(input);
        if (amount != null && amount > 0) {
  
          enteredAmount(amount);
        }
      },
      keyboardType: TextInputType.number,
      controller: _controller,
      style: customStyle,
      decoration: InputDecoration(
        hintText: "0",
        hintStyle: customStyle,
        prefixText: "₹ ",
        prefixStyle: customStyle,
        border: InputBorder.none,
      ),
    );
  }
}
