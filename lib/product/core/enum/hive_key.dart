/// Hive key enum
enum HiveKey {
  /// The key for the category dices
  categoryDicesManagerKey('categoryDices'),

  /// Favorite Dices key
  favoriteDicesKey('favoriteDices');

  /// The key for the sub dices
  final String value;

  const HiveKey(this.value);
}
