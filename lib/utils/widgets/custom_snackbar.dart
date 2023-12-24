import 'package:flutter/material.dart';

void customSnackbar({
  required BuildContext context,
  required String message,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,
    duration: const Duration(milliseconds: 1500),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

