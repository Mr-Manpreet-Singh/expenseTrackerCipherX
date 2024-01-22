import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key,required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
   bool _isShowPassword = true;

  void _showPassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => widget.controller.text = value,
      obscureText: _isShowPassword,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: _showPassword,
            icon: (_isShowPassword
                ? const Icon(Icons.visibility_rounded)
                : const Icon(Icons.visibility_off_rounded)),
          ),
          hintText: "Password",
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          )),
    );
  }
}
