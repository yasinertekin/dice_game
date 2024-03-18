/// Hive key enum
enum HiveKey {
  /// The key for the category dices
  categoryDicesManagerKey('categoryDices');

  /// The key for the sub dices
  final String value;

  const HiveKey(this.value);
}
