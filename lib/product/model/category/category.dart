import 'package:dice_game/product/model/categories/categories.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
final class Category with EquatableMixin {
  Category({
    this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  @JsonKey(name: 'categories')
  List<Categories>? categories;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [categories];

  Category copyWith({
    List<Categories>? categories,
  }) {
    return Category(
      categories: categories ?? this.categories,
    );
  }
}
