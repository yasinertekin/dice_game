import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SVGFilesCubit extends Cubit<List<String>> {
  SVGFilesCubit() : super([]);

  int selectedIconIndex = -1;

  /// Seçili indexsin colorunu değiştirir
  void selectIcon(int index) {
    selectedIconIndex = index;
    emit([...state]);
  }

  /// Selected icon
  String get selectedIcon => state[selectedIconIndex];

  Future<void> listSVGFiles(String directory) async {
    final svgFiles = <String>[];

    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final manifestMap = json.decode(manifestContent) as Map<String, dynamic>;

      for (final key in manifestMap.keys) {
        if (key.startsWith(directory) && key.endsWith('.svg')) {
          svgFiles.add(key);
        }
      }
    } catch (e) {
      print('Error listing SVG files: $e');
    }

    emit(svgFiles);
  }
}
