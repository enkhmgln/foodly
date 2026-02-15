import 'package:get/get.dart';
import 'package:foodly/client/api/auth_api.dart';
import 'package:foodly/client/models/auth_response_model.dart';
import 'package:foodly/client/models/user_model.dart';
import 'package:foodly/core/storage/secure_storage_service.dart';
import 'package:foodly/screens/auth/login/_.dart';
import 'package:foodly/screens/home/home/_.dart';

class AuthService extends GetxService {
  final SecureStorageService _storage = Get.find<SecureStorageService>();

  final RxBool isLoggedIn = false.obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  String? _token;

  String? getToken() => _token;

  late final Future<void> _tokenLoaded = _loadStoredToken();
  Future<void> get tokenLoaded => _tokenLoaded;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> _loadStoredToken() async {
    _token = await _storage.readToken();
    if (_token != null && _token!.isNotEmpty) {
      isLoggedIn.value = true;
    }
  }

  Future<void> login(String email, String password) async {
    final authApi = Get.find<AuthApi>();
    final result = await authApi.login(email: email, password: password);
    if (result == null) return;
    await _saveAuth(result);
    Get.offAllNamed(HomeView.routeName);
  }

  Future<void> signUp(String email, String password, {String? name}) async {
    final authApi = Get.find<AuthApi>();
    final result = await authApi.signUp(
      email: email,
      password: password,
      name: name,
    );
    if (result == null) return;
    await _saveAuth(result);
    Get.offAllNamed(HomeView.routeName);
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
