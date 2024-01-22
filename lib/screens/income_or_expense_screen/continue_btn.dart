import 'package:expense_tracker_app/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    
    final customStyle = CustomTextStyles.customStyle(
      color: const Color(0xFFFBFBFB),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

    return FractionallySizedBox(
      widthFactor: .95,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF7B61FF)),
          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Continue",
              style: customStyle,
            ),
          )),
    );
  }
}
