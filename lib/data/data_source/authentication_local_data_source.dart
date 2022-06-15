import 'package:flutter_todo_app/core/constants.dart';
import 'package:flutter_todo_app/service/secure_storage/secure_storage_service.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();

  Future<void> deleteToken();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  final SecureStorageService secureStorageService;
  AuthenticationLocalDataSourceImpl(this.secureStorageService);
  @override
  Future<void> saveToken(String token) async {
    await secureStorageService.write(key: Constants.tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorageService.read(key: Constants.tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    return await secureStorageService.clearAll();
  }
}
