import 'package:dice_game/product/model/dice_list/dice_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dice_categories.g.dart';

@JsonSerializable()
class DiceCategories with EquatableMixin {
  DiceCategories({
    this.categoryName,
    this.categoryColor,
    this.diceList,
  });

  factory DiceCategories.fromJson(Map<String, dynamic> json) =>
      _$DiceCategoriesFromJson(json);
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'category_color')
  String? categoryColor;
  @JsonKey(name: 'dice_list')
  List<DiceList>? diceList;

  Map<String, dynamic> toJson() => _$DiceCategoriesToJson(this);

  @override
  List<Object?> get props => [categoryName, categoryColor, diceList];

  DiceCategories copyWith({
    String? categoryName,
    String? categoryColor,
    List<DiceList>? diceList,
  }) {
    return DiceCategories(
      categoryName: categoryName ?? this.categoryName,
      categoryColor: categoryColor ?? this.categoryColor,
      diceList: diceList ?? this.diceList,
    );
  }
}
