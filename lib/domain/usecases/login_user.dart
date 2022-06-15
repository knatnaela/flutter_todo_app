import 'package:flutter_todo_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_todo_app/domain/entities/auth_entity.dart';
import 'package:flutter_todo_app/domain/respository/authentication_repository.dart';
import 'package:flutter_todo_app/domain/usecases/usecase.dart';

import '../../data/models/auth_model/auth_request.dart';

class LoginUser extends UseCase<AuthEntity, AuthRequest> {
  final AuthenticationRepository authenticationRepository;
  LoginUser(this.authenticationRepository);
  @override
  Future<Either<AppError, AuthEntity>> call(AuthRequest params) async {
    return await authenticationRepository.login(authRequest: params);
  }
}
