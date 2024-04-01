import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    super.key,
    this.style,
  });

  final String text;

  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    ).tr();
  }
}
