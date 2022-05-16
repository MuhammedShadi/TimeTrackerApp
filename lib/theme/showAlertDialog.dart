import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String defaultActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            MaterialButton(
              child: Text(defaultActionText),
              onPressed: () {
                Navigator.of(context).pop(true); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(defaultActionText),
            onPressed: () {
              Navigator.of(context).pop(true); // Dismiss alert dialog
            },
          ),
        ],
      );
    },
  );
}
