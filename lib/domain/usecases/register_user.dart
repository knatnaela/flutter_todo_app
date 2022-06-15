import 'package:dartz/dartz.dart';
import 'package:flutter_todo_app/data/models/user_model/user_model.dart';
import 'package:flutter_todo_app/data/models/user_model/user_request.dart';
import 'package:flutter_todo_app/domain/entities/app_error.dart';
import 'package:flutter_todo_app/domain/entities/user_entity.dart';
import 'package:flutter_todo_app/domain/respository/authentication_repository.dart';

import 'usecase.dart';

class RegisterUser extends UseCase<UserEntity, UserRequest> {
  final AuthenticationRepository authenticationRepository;
  RegisterUser(this.authenticationRepository);
  @override
  Future<Either<AppError, UserEntity>> call(UserRequest params) async {
    return await authenticationRepository.register(userRequest: params);
  }
}
