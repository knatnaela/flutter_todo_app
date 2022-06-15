import 'package:dartz/dartz.dart';
import 'package:flutter_todo_app/domain/entities/app_error.dart';
import 'package:flutter_todo_app/domain/entities/no_params.dart';
import 'package:flutter_todo_app/domain/respository/authentication_repository.dart';
import 'package:flutter_todo_app/domain/usecases/usecase.dart';

class LogOutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository authenticationRepository;
  LogOutUser(this.authenticationRepository);
  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await authenticationRepository.logOut();
  }
}
