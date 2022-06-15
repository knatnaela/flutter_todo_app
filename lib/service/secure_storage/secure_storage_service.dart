abstract class SecureStorageService {
  Future<void> init();
  Future<bool> isExists({required String key});
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> clear({required String key});
  Future<void> clearAll();
}
