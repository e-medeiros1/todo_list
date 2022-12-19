import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  void Function()? onPressed;

  CustomIconButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.blue,
      iconSize: 40,
      icon: const Icon(Icons.add_circle_outline, color: Colors.blue, size: 40),
    );
  }
}
