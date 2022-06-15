import 'package:flutter_todo_app/data/models/base_model/base_single_response_model.dart';

import '../../service/apis.dart';
import '../../service/http/http_service.dart';
import '../models/auth_model/auth_model.dart';
import '../models/auth_model/auth_request.dart';
import '../models/user_model/user_model.dart';
import '../models/user_model/user_request.dart';

abstract class AuthenticationRemoteDataSource {
  Future<BaseSingleResponseModel<AuthModel>> login({
    required AuthRequest authRequest,
  });

  Future<BaseSingleResponseModel<UserModel>> register({
    required UserRequest userRequest,
  });
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  HttpService httpService;
  AuthenticationRemoteDataSourceImpl(
    this.httpService,
  );
  @override
  Future<BaseSingleResponseModel<AuthModel>> login({
    required AuthRequest authRequest,
  }) async {
    try {
      final response = await httpService.postRequest(
        urlPath: Apis.login,
        data: authRequest.toJson(),
      );
      return BaseSingleResponseModel.fromJson(
        response.data,
        AuthModel.fromJsonModel,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseSingleResponseModel<UserModel>> register(
      {required UserRequest userRequest}) async {
    try {
      final response = await httpService.postRequest(
        urlPath: Apis.register,
        data: userRequest.toJson(),
      );
      return BaseSingleResponseModel.fromJson(
        response.data,
        UserModel.fromJsonModel,
      );
    } catch (e) {
      rethrow;
    }
  }
}
