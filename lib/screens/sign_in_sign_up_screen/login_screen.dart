import 'package:expense_tracker_app/firebase/auth_services.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/name_and_email_text_field.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/password_text_field.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/signin_signup_helper.dart';
import 'package:expense_tracker_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  void onLoginButtonPress(context) async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      customSnackBar(
          context, "Something Went Wrong!! Please Verify Your Input");
      return;
    }
    final bool status = await AuthService.loginUserWithEmailPassword(context,
        email: _emailController.text, password: _passwordController.text);

    if (status) {
      customSnackBar(context, "SignUpSuccess");
      Navigator.of(context).pop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignInSignUpHelper.signUpLoginAppBar(context, 'Login'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 160),
            NameAndEmailTextField(
                hintText: "Email", controller: _emailController),
            const SizedBox(height: 24),
            PasswordTextField(controller: _passwordController),
            const SizedBox(height: 48),
            FractionallySizedBox(
              widthFactor: 0.95, // 80% of the parent's width
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF7E3DFF))),
                onPressed: () {
                  onLoginButtonPress(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Login",
                    style: GoogleFonts.inter(
                      color: const Color(0xFFFBFBFB),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
