import 'package:dice_game/product/model/category_dices/category_dices.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Categories with EquatableMixin {
  Categories({
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
    this.categoryDices,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  @JsonKey(name: 'categoryName')
  String? categoryName;
  @JsonKey(name: 'categoryIcon')
  String? categoryIcon;
  @JsonKey(name: 'categoryColor')
  String? categoryColor;
  @JsonKey(name: 'categoryDices')
  List<CategoryDices>? categoryDices;

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

  @override
  List<Object?> get props =>
      [categoryName, categoryIcon, categoryColor, categoryDices];

  Categories copyWith({
    String? categoryName,
    String? categoryIcon,
    String? categoryColor,
    List<CategoryDices>? categoryDices,
  }) {
    return Categories(
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      categoryColor: categoryColor ?? this.categoryColor,
      categoryDices: categoryDices ?? this.categoryDices,
    );
  }
}
