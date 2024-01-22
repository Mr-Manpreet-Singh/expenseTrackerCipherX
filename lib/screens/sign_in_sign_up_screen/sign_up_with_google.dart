import 'package:expense_tracker_app/providers/google_signin_provider.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/signin_signup_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  const SignUpWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95, // 80% of the parent's width
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          Provider.of<GoogleSignInProvider>(context, listen: false).signIn();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/google_icon.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SignInSignUpHelper.signUpWithGoogleTextBox,
            ),
          ],
        ),
      ),
    );
  }
}
