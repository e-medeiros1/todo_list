import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  Input({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'O que devo fazer?',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      controller: controller,
    );
  }
}
