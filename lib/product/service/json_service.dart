import 'dart:convert';

import 'package:dice_game/product/model/dice_model/dice_model.dart';
import 'package:flutter/services.dart';

// ignore: one_member_abstracts
/// IJsonService
abstract interface class IJsonService {
  /// Get destinations
  Future<DiceModel> getDiceModel();
}

/// JsonService
final class JsonService implements IJsonService {
  @override
  Future<DiceModel> getDiceModel() async {
    final data = await rootBundle.loadString(_DicePath.dicePath.value);
    final jsons = json.decode(data) as Map<String, dynamic>;
    return DiceModel.fromJson(jsons);
  }
}

enum _DicePath {
  dicePath('assets/data/data.json');

  final String value;

  const _DicePath(this.value);
}
