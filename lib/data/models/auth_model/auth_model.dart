import 'package:flutter_todo_app/domain/entities/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends AuthEntity {
  AuthModel({
    String? token,
  }) : super(token: token);

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  factory AuthModel.fromJsonModel(Object? json) =>
      _$AuthModelFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJsonModel(AuthModel model) => _$AuthModelToJson(model);
}
