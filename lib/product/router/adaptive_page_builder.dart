import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable

/// AdaptivePageBuilder
/// [builder] is a function that returns a [Page] based on the platform.
final class AdaptivePageBuilder {
  const AdaptivePageBuilder._();

  /// builder
  static Page<T> builder<T>({
    required Widget child,
  }) {
    if (Platform.isIOS) {
      return CupertinoPage<T>(
        child: child,
      );
    }
    return MaterialPage<T>(
      child: child,
    );
  }
}
