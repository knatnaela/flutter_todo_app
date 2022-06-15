import 'package:flutter_todo_app/data/models/user_model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserResponse {
  final UserModel user;
  UserResponse({
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  factory UserResponse.fromJsonModel(Object? json) =>
      _$UserResponseFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJsonModel(UserResponse model) =>
      _$UserResponseToJson(model);
}
