import 'package:json_annotation/json_annotation.dart';
part 'auth_request.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class AuthRequest {
  final String email;
  final String password;
  AuthRequest({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}
