import 'dart:convert';

import 'package:dice_game/product/core/model/category/category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: one_member_abstracts
/// IJsonService
abstract interface class IJsonService {
  /// Get destinations
  Future<Category> getDiceModel(BuildContext context);
}

/// JsonService
final class JsonService implements IJsonService {
  @override
  Future<Category> getDiceModel(BuildContext context) async {
    String getDicePath(Locale locale) {
      switch (locale.languageCode) {
        case 'tr':
          return _DicePath.dicePath.value;
        case 'en':
          return _DicePath.dicePathEn.value;
        case 'es': // Spanish
          return _DicePath.es.value;
        default:
          throw UnsupportedError('Unsupported locale: ${locale.languageCode}');
      }
    }

    final data = await rootBundle.loadString(
      getDicePath(context.locale),
    );

    final jsons = json.decode(data) as Map<String, dynamic>;
    return Category.fromJson(jsons);
  }
}

enum _DicePath {
  dicePathEn('assets/data/en.json'),
  es('assets/data/es.json'),
  dicePath('assets/data/tr.json');

  final String value;

  const _DicePath(this.value);
}
