import 'package:flutter/material.dart';

class CustomeRaisedButton extends StatelessWidget {
  CustomeRaisedButton({
    required this.color,
    required this.child,
    required this.borderRadius,
    required this.onPressed,
  });

  Widget child;
  Color color;
  double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      child: child,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      onPressed: onPressed,
    );
  }
}
