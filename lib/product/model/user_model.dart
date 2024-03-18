import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@immutable
@HiveType(typeId: 0)
final class UserModel extends Equatable {
  /// Creates a new instance of the [UserModel] class.
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  /// The id of the user.
  @HiveField(0)
  final String id;

  /// The name of the user.
  @HiveField(1)
  final String name;

  /// The email of the user.
  final String email;

  /// The password of the user.
  @HiveField(2)
  final String password;

  @override
  List<Object> get props => [id, name, email, password];
}
