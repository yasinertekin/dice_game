import 'dart:convert';

import 'package:dice_game/product/model/dice_model.dart';
import 'package:flutter/services.dart';

// ignore: one_member_abstracts
/// IJsonService
abstract class IJsonService {
  /// Get destinations
  Future<List<DiceModel>> getDestinations();
}

/// JsonService
final class JsonService implements IJsonService {
  @override
  Future<List<DiceModel>> getDestinations() async {
    try {
      final jsonString = await rootBundle.loadString('assets/dice.json');
      final jsonList =
          (json.decode(jsonString) as List).cast<Map<String, dynamic>>();
      // JSON'daki her bir öğeyi Destination nesnesine dönüştür
      final destinations = jsonList.map(DiceModel.fromJson).toList();

      return destinations;
    } catch (e) {
      print('Error: $e');
      return []; // Hata durumunda boş bir liste döndür
    }
  }
}
