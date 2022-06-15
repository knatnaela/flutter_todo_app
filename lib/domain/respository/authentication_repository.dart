import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_todo_app/data/models/user_model/user_model.dart';
import 'package:flutter_todo_app/data/models/user_model/user_request.dart';
import 'package:flutter_todo_app/domain/entities/auth_entity.dart';
import 'package:flutter_todo_app/domain/entities/user_entity.dart';

import '../../data/models/auth_model/auth_request.dart';
import '../entities/app_error.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, AuthEntity>> login({
    required AuthRequest authRequest,
  });
  Future<Either<AppError, UserEntity>> register({
    required UserRequest userRequest,
  });
  Future<Either<AppError, void>> logOut();
}
