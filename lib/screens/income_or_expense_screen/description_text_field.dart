import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  DescriptionTextField({super.key, required this.enteredDescription});

  final TextEditingController _controller = TextEditingController(text: '');
  final void Function(String) enteredDescription;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (_) {
        if (_controller.text.trim().isNotEmpty) {
          enteredDescription(_controller.text);
        }
      },
      decoration: const InputDecoration(
        hintText: "Description",
      ),
    );
  }
}
