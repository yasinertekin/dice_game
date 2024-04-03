part of 'dice_type_cubit.dart';

/// DiceState
@immutable
final class DiceState extends Equatable {
  /// Constructor
  const DiceState({this.selectedDice = DiceType.defaultDice});

  /// fromMap
  factory DiceState.fromMap(Map<String, dynamic> map) {
    return DiceState(selectedDice: DiceType.values[map['selectedDice'] as int]);
  }

  /// selectedDice
  final DiceType selectedDice;

  /// toMap
  Map<String, dynamic> toMap() {
    return {'selectedDice': selectedDice.index};
  }

  @override
  List<Object> get props => [selectedDice];
}

/// DiceType
enum DiceType {
  /// defaultDice
  defaultDice('default'),

  /// blueDice
  blueDice('blue'),

  /// dogDice
  pinkDice('pink'),

  /// catDice
  catDice('cat');

  /// Constructor
  final String value;

  // ignore: sort_constructors_first
  const DiceType(this.value);

  /// toLottie
  String get toLottie => 'assets/lottie/lottie_${value}_dice.json';
}
