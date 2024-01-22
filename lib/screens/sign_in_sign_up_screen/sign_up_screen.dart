import 'package:expense_tracker_app/firebase/auth_services.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/login_screen.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/name_and_email_text_field.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/password_text_field.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/sign_up_button.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/sign_up_with_google.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/terms_condition_checkbox.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/signin_signup_helper.dart';
import 'package:expense_tracker_app/utils/snackbar.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;

  void _onSignUpButtonPressed(context) async {
    print("SignUPButton Pressed---------------");
    print(
        "${_nameController.text}, ${_emailController.text}, ${_passwordController.text},  ${isChecked}");
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        isChecked == false) {
      customSnackBar(
          context, "Something Went Wrong!! Please Verify Your Input");
      return;
    }

    final bool status = await AuthService.signUpUserWithEmailPassword(context,
        email: _emailController.text,
        password: _passwordController.text,
        username: _nameController.text);
    if (status == true) {
      customSnackBar(context, "SignUpSuccess");
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("Rebuilding SIGNUP.....");
    return Scaffold(
      appBar: SignInSignUpHelper.signUpLoginAppBar(context, "Sign Up"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 56),
              NameAndEmailTextField(
                  controller: _nameController, hintText: "Name"),
              const SizedBox(height: 24),
              NameAndEmailTextField(
                  controller: _emailController, hintText: "Email"),
              const SizedBox(height: 24),
              PasswordTextField(controller: _passwordController),
              const SizedBox(height: 17),
              Row(
                children: [
                  TermsAndConditionCheckbox(
                    onTap: (value) {
                      isChecked = value;
                    },
                  ),
                  const SizedBox(width: 12),
                  SignInSignUpHelper.termsAndConditionTextBox
                ],
              ),
              const SizedBox(height: 27),
              SignUpButton(
                onTap: _onSignUpButtonPressed,
              ),
              const SizedBox(height: 12),
              SignInSignUpHelper.orWithTextBox,
              const SizedBox(height: 12),
              const SignUpWithGoogleButton(),
              const SizedBox(height: 19),
              // InkWell(
              // onTap: () => Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => LoginScreen(),
              // ),
              // ),
              // child:
              SignInSignUpHelper.loginTextBox
            ],
          ),
        ),
      ),
    );
  }
}
