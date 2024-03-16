import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A custom widget to display SVG files
final class CustomSvg extends StatelessWidget {
  /// The constructor requires the path to the SVG file
  const CustomSvg({
    required this.assetPath,
    super.key,
    this.height = 32,
    this.fit = BoxFit.contain,
  });

  /// The path to the SVG file
  final String assetPath;

  /// The height of the SVG file
  final double height;

  /// The fit of the SVG file
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      fit: fit,
    );
  }
}
