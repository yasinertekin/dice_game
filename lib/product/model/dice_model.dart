import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dice_model.g.dart';

@JsonSerializable()
final class DiceModel with EquatableMixin {
  DiceModel({
    this.id,
    this.name,
    this.stringUrl,
  });

  factory DiceModel.fromJson(Map<String, dynamic> json) =>
      _$DiceModelFromJson(json);
  final String? id;
  final String? name;
  final String? stringUrl;

  Map<String, dynamic> toJson() => _$DiceModelToJson(this);

  @override
  List<Object?> get props => [id, name, stringUrl];
}
