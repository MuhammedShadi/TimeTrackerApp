import 'package:flutter/material.dart';
import 'package:timetracker/widgets/customesButtons.dart';

class FormSubmitButton extends CustomeRaisedButton {
  FormSubmitButton({
    required String text,
    required VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.indigo,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
