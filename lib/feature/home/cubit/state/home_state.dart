import 'package:dice_game/product/core/model/category/category.dart';
import 'package:equatable/equatable.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.diceModel,
    this.status = HomeStatus.initial,
  });

  final Category? diceModel;
  final HomeStatus status;

  HomeState copyWith({
    Category? diceModel,
    HomeStatus? status,
  }) {
    return HomeState(
      diceModel: diceModel ?? this.diceModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [diceModel, status];
}

enum HomeStatus { initial, loading, loaded, error }
