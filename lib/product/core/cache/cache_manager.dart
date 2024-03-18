import 'package:dice_game/product/core/constants/hive_type_id_constants.dart';
import 'package:dice_game/product/model/category_dices/category_dices.dart';
import 'package:hive/hive.dart';

/// Represents a cache manager.
abstract final class ICacheManager<T> {
  /// Creates a new instance of the [ICacheManager] class.
  ICacheManager(this.key);

  /// The key of the box.
  final String key;

  Box<T>? _boxBooks;

  /// Initializes the box.
  Future<void> init() async {
    saveDataAdapter();
    if (!(_boxBooks?.isOpen ?? false)) {
      _boxBooks = await Hive.openBox<T>(key);
    }
  }

  /// Closes the box.
  void saveDataAdapter();

  /// Closes the box.
  Future<void> clearAll() async {
    await _boxBooks?.clear();
  }

  /// Closes the box.
  Future<void> addItems(List<T> items);

  /// Closes the box.
  Future<void> putItems(List<T> items);

  /// getItem
  T? getItem(String key);

  /// Closes the box.
  List<T> getValues();

  /// putItem
  Future<void> putItem(String key, T item);

  /// removeItem
  Future<void> removeItem(String key);

  /// removeItem
  Future<void> removeModel(T item);

  /// Updates the item.
  Future<void> updateItem(T item);
}

/// Represents a cache manager for the [CategoryDices] model.
final class CategoryDicesCacheManager extends ICacheManager<CategoryDices> {
  /// Creates a new instance of the [CategoryDicesCacheManager] class.
  CategoryDicesCacheManager(super.key);

  @override
  Future<void> addItems(List<CategoryDices> items) async {
    await _boxBooks?.addAll(items);
  }

  @override
  CategoryDices? getItem(String key) {
    return _boxBooks?.get(key);
  }

  @override
  List<CategoryDices> getValues() {
    return _boxBooks?.values.toList() ?? [];
  }

  @override
  Future<void> putItem(String key, CategoryDices item) async {
    return _boxBooks?.put(key, item);
  }

  @override
  Future<void> putItems(List<CategoryDices> items) async {
    await _boxBooks?.putAll(
      {for (final item in items) item.id: item},
    );
  }

  @override
  Future<void> removeItem(String key) async {
    await _boxBooks?.delete(key);
  }

  @override
  Future<void> removeModel(CategoryDices item) {
    return removeItem(item.id ?? '');
  }

  @override
  Future<void> updateItem(CategoryDices item) {
    return putItem(item.id ?? '', item);
  }

  @override
  void saveDataAdapter() {
    if (!Hive.isAdapterRegistered(HiveTypeIdConstants.categoryDicesId)) {
      Hive.registerAdapter(
        CategoryDicesAdapter(),
      );
    }
  }
}
