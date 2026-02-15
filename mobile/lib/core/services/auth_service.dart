import 'package:get/get.dart';
import '/client/api/api_result.dart';
import '/client/api/auth_api.dart';
import '/client/models/auth_response_model.dart';
import '/client/models/user_model.dart';
import '/core/storage/secure_storage_service.dart';
import '/screens/auth/login/_.dart';
import '/screens/home/home/_.dart';

class AuthService extends GetxService {
  final SecureStorageService _storage = Get.find<SecureStorageService>();

  final RxBool isLoggedIn = false.obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  String? _token;

  String? getToken() => _token;

  late final Future<void> _tokenLoaded = _loadStoredToken();
  Future<void> get tokenLoaded => _tokenLoaded;

  Future<void> _loadStoredToken() async {
    _token = await _storage.readToken();
    if (_token != null && _token!.isNotEmpty) {
      isLoggedIn.value = true;
    }
  }

  /// Returns [ApiResult] so callers can show error without try-catch.
  Future<ApiResult<Object?>> login(String email, String password) async {
    final authApi = Get.find<AuthApi>();
    final result = await authApi.login(email: email, password: password);
    if (result.isFailure) {
      return ApiFailure(result.message, statusCode: result.statusCode);
    }
    final data = result.dataOrNull;
    if (data == null) return const ApiFailure('Алдаа гарлаа');
    await _saveAuth(data);
    Get.offAllNamed(HomeView.routeName);
    return const ApiSuccess(null);
  }

  /// Returns [ApiResult] so callers can show error without try-catch.
  Future<ApiResult<Object?>> signUp(
    String email,
    String password, {
    String? name,
  }) async {
    final authApi = Get.find<AuthApi>();
    final result = await authApi.signUp(
      email: email,
      password: password,
      name: name,
    );
    if (result.isFailure) {
      return ApiFailure(result.message, statusCode: result.statusCode);
    }
    final data = result.dataOrNull;
    if (data == null) return const ApiFailure('Алдаа гарлаа');
    await _saveAuth(data);
    Get.offAllNamed(HomeView.routeName);
    return const ApiSuccess(null);
  }

  Future<void> _saveAuth(AuthResponseModel result) async {
    _token = result.token;
    currentUser.value = result.user;
    isLoggedIn.value = true;
    await _storage.writeToken(result.token);
  }

  Future<void> logout() async {
    _token = null;
    currentUser.value = null;
    isLoggedIn.value = false;
    await _storage.clearToken();
    Get.offAllNamed(LoginView.routeName);
  }
}
