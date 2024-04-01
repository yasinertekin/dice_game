import 'dart:convert';

import 'package:dice_game/product/core/model/category/category.dart';
import 'package:dice_game/product/utils/localization/localization_manager.dart';
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
    final data = context.locale == Locales.en.locale
        ? await rootBundle.loadString(_DicePath.dicePathEn.value)
        : await rootBundle.loadString(_DicePath.dicePath.value);

    final jsons = json.decode(data) as Map<String, dynamic>;
    return Category.fromJson(jsons);
  }
}

enum _DicePath {
  dicePathEn('assets/data/en.json'),
  dicePath('assets/data/tr.json');

  final String value;

  const _DicePath(this.value);
}
