import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    super.key,
    this.style,
    this.textAlign,
  });

  final String text;

  final TextStyle? style;

  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: style,
    ).tr();
  }
}
