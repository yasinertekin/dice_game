import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SVGFilesCubit extends Cubit<List<String>> {
  SVGFilesCubit() : super([]);

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
