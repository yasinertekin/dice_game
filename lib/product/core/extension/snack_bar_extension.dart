import 'package:flutter/material.dart';

extension CustomSnackBar on BuildContext {
  void showCustomSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
