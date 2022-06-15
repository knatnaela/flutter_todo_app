import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_todo_app/data/data_source/authentication_local_data_source.dart';
import 'package:flutter_todo_app/data/data_source/authentication_remote_data_source.dart';
import 'package:flutter_todo_app/data/models/user_model/user_request.dart';
import 'package:flutter_todo_app/domain/entities/app_error.dart';
import 'package:flutter_todo_app/domain/entities/auth_entity.dart';
import 'package:flutter_todo_app/domain/entities/user_entity.dart';
import 'package:flutter_todo_app/domain/respository/authentication_repository.dart';
import 'package:flutter_todo_app/service/dio_exceptions.dart';

import '../models/auth_model/auth_request.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
      this.authenticationRemoteDataSource, this.authenticationLocalDataSource);
  @override
  Future<Either<AppError, AuthEntity>> login({
    required AuthRequest authRequest,
  }) async {
    try {
      final response =
          await authenticationRemoteDataSource.login(authRequest: authRequest);
      if (response.data == null) {
        return Left(AppError(message: "Something went wrong"));
      }
      await authenticationLocalDataSource.saveToken(response.data!.token!);
      return Right(response.data!);
    } on DioError catch (e) {
      final error = DioExceptions.fromDioError(e);
      return Left(AppError(message: error.baseResponse.error!));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> register(
      {required UserRequest userRequest}) async {
    try {
      final response = await authenticationRemoteDataSource.register(
          userRequest: userRequest);
      if (response.data == null) {
        return Left(AppError(message: "Something went wrong"));
      }
      return Right(response.data!);
    } on DioError catch (e) {
      final error = DioExceptions.fromDioError(e);
      return Left(AppError(message: error.baseResponse.error!));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> logOut() async {
    await authenticationLocalDataSource.deleteToken();
    // ignore: void_checks
    return const Right(Unit);
  }
}
