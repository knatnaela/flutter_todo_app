import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_todo_app/service/secure_storage/secure_storage_service.dart';

class SecureStorageServiceImpl extends SecureStorageService {
  late FlutterSecureStorage secureStorage;

  @override
  Future<String?> read({required String key}) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> clear({required String key}) async {
    await secureStorage.delete(key: key);
  }

  @override
  Future<void> clearAll() async {
    await secureStorage.deleteAll();
  }

  @override
  Future<void> init() async {
    IOSOptions _getIOSOptions() => const IOSOptions();

    AndroidOptions _getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    secureStorage = FlutterSecureStorage(
        iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  @override
  Future<bool> isExists({required String key}) async {
    return await secureStorage.containsKey(key: key);
  }
}
