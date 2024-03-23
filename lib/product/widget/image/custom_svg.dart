import 'package:dice_game/product/core/enum/project_assets.dart';
import 'package:dice_game/product/core/enum/project_color.dart';
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
    this.color,
  });

  /// The path to the SVG file
  final String? assetPath;

  /// The height of the SVG file
  final double height;

  /// The fit of the SVG file
  final BoxFit fit;

  final Color? color;

  String get _assetPath => assetPath?.isNotEmpty ?? false ? assetPath! : '';

  @override
  Widget build(BuildContext context) {
    return _assetPath.isEmpty
        ? _DefaultIcon(height: height, fit: fit)
        : _CustomAssets(
            assetPath: _assetPath,
            height: height,
            fit: fit,
            color: color,
          );
  }
}

final class _CustomAssets extends StatelessWidget {
  const _CustomAssets({
    required String assetPath,
    required this.height,
    required this.fit,
    this.color,
  }) : _assetPath = assetPath;

  final String _assetPath;
  final double height;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _assetPath,
      height: height,
      colorFilter: ColorFilter.mode(
        color ?? ProjectColor.white.toColor,
        BlendMode.srcIn,
      ),
      fit: fit,
    );
  }
}

final class _DefaultIcon extends StatelessWidget {
  const _DefaultIcon({
    required this.height,
    required this.fit,
  });

  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ProjectAssets.icHeard.toSvg,
      height: height,
      theme: const SvgTheme(
        currentColor: Colors.white,
      ),
      fit: fit,
    );
  }
}
