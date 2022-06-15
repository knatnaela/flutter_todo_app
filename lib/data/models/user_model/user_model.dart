import 'package:flutter_todo_app/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  final String? id;

  final String? password;
  final String? createdAt;
  UserModel({
    this.id,
    String? name,
    String? email,
    this.password,
    this.createdAt,
  }) : super(email: email ?? "", name: name ?? "");

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJsonModel(Object? json) =>
      _$UserModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJsonModel(UserModel model) => _$UserModelToJson(model);
}
