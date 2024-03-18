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
