import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'usermodel.freezed.dart';

part 'usermodel.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required int id,
      required String name,
      required String email,
      required String phone,
      required int age,
      required String createdAt}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
