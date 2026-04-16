import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showSnackbar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(text)),
    );
  }
}
