import 'package:dice_game/locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

@immutable

/// This class is used to initialize the app
final class AppInitialize {
  const AppInitialize._();

  /// This method is used to initialize the app
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MobileAds.instance.initialize();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: appDocumentDirectory,
    );

    await Locator.setup();
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();
  }
}
