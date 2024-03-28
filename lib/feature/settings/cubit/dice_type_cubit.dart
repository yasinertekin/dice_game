import 'package:flutter_bloc/flutter_bloc.dart';

final class DiceTypeCubit extends Cubit<DiceType> {
  DiceTypeCubit() : super(DiceType.defaultDice);

  void changeDice(DiceType diceType) => emit(diceType);
}

enum DiceType {
  defaultDice('default'),
  blueDice('blue'),
  ;

  final String value;

  const DiceType(this.value);

  String get toLottie => 'assets/lottie/lottie_${value}_dice.json';
}
