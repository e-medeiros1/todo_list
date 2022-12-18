import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatingButton extends StatelessWidget {
  void Function()? onPressed;
  Icon icon;
  FloatingButton({Key? key, required this.onPressed, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: onPressed,
      child: icon,
    );
  }
}
