import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onTap});

  final void Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95, // 80% of the parent's width
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFF7E3DFF))),
        onPressed: () {
          onTap(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Sign up",
            style: GoogleFonts.inter(
              color: const Color(0xFFFBFBFB),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
