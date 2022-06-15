import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  final String name;
  final String email;
  final String password;
  UserRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
