import 'package:expense_tracker_app/screens/on_boarding_screen.dart';
import 'package:expense_tracker_app/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class SignInSignUpHelper {
  //  TextBox

  static Column termsAndConditionTextBox = const Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        'By signing up, you agree to the',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        'Terms of Service and Privacy Policy',
        style: TextStyle(
          color: Color(0xFF7E3DFF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );

  // Login text Box

  static final Text loginTextBox = Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: 'Already have an account? ',
          style: CustomTextStyles.customStyle(
            color: const Color(0xFF90909F),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: 'Login',
          style: CustomTextStyles.customStyle(
            color: const Color(0xFF7E3DFF),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );

  static Text orWithTextBox = Text(
    'Or with',
    style: CustomTextStyles.customStyle(
      color: const Color(0xFF90909F),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );

  static Text signUpWithGoogleTextBox = Text(
    'Sign Up with Google',
    style: CustomTextStyles.customStyle(
      color: const Color(0xFF212224),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );

  static AppBar signUpLoginAppBar(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            if (title == "Login") {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GettingStarted(),
                  ));
            }
          },
          icon: const Icon(Icons.arrow_back)),
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: const Color(0xFF212224),
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 0,
        ),
      ),
    );
  }
}
