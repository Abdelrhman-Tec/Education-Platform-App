import 'package:flutter/material.dart';

/// A helper class to show consistent snackbars across the app.
class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color textColor = Colors.white,
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor, fontSize: 15),
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
