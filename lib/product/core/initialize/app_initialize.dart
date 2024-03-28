import 'package:dice_game/locator.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

@immutable

/// This class is used to initialize the app
final class AppInitialize {
  const AppInitialize._();

  /// This method is used to initialize the app
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    await Locator.setup();
    await Hive.initFlutter();
  }
}
