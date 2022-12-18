
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController, super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
    );
  }
}
