import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@immutable

/// This class is used to initialize the app
final class AppInitialize {
  const AppInitialize._();

  /// This method is used to initialize the app
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
  }
}
