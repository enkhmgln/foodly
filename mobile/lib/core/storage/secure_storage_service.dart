import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '/core/constants/constant.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> writeToken(String? token) async {
    if (token == null || token.isEmpty) {
      await _storage.delete(key: kAuthToken);
    } else {
      await _storage.write(key: kAuthToken, value: token);
    }
  }

  Future<String?> readToken() async {
    return _storage.read(key: kAuthToken);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: kAuthToken);
  }
}
