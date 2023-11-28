import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

@HiveType(typeId: 0)
@freezed
class User with _$User{

  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required DateTime createdAt
  }) = _User;
  factory User.fromJson(Map<String,dynamic> json)=> _$UserFromJson(json);

}
