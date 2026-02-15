import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:foodly/core/services/auth_service.dart';
import 'package:foodly/screens/auth/signup/_.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> login() async {
    final e = email.value.trim();
    final p = password.value;
    if (e.isEmpty || p.isEmpty) {
      errorMessage.value = 'Имэйл болон нууц үгээ оруулна уу';
      return;
    }
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _authService.login(e, p);
    } on dio.DioException catch (e) {
      errorMessage.value = _extractMessage(e);
      Get.snackbar('Алдаа', errorMessage.value);
    } on Exception catch (e) {
      errorMessage.value = _extractMessageFromException(e);
      Get.snackbar('Алдаа', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  void goToSignUp() {
    Get.toNamed(SignupView.routeName);
  }

  String _extractMessage(dio.DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final msg = data['message'];
      if (msg is String && msg.isNotEmpty) return msg;
    }
    if (e.response?.statusCode == 401) return 'Нэвтрэх нэр эсвэл нууц үг буруу';
    return 'Нэвтрэхэд алдаа гарлаа';
  }

  String _extractMessageFromException(Exception e) {
    final s = e.toString();
    if (s.contains('401') || s.contains('Нэвтрэх')) return 'Нэвтрэх нэр эсвэл нууц үг буруу';
    return 'Нэвтрэхэд алдаа гарлаа';
  }
}
