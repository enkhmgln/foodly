import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:foodly/core/services/auth_service.dart';
import 'package:foodly/screens/auth/login/_.dart';

class SignupController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxString email = ''.obs;
  final RxString name = ''.obs;
  final RxString password = ''.obs;
  final RxString confirmPassword = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> signUp() async {
    final e = email.value.trim();
    final p = password.value;
    final cp = confirmPassword.value;
    final n = name.value.trim();

    if (e.isEmpty || p.isEmpty) {
      errorMessage.value = 'Имэйл болон нууц үгээ оруулна уу';
      return;
    }
    if (p.length < 8) {
      errorMessage.value = 'Нууц үг хамгийн багадаа 8 тэмдэгт байна';
      return;
    }
    if (p != cp) {
      errorMessage.value = 'Нууц үг тохирохгүй байна';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _authService.signUp(e, p, name: n.isEmpty ? null : n);
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

  void goToLogin() {
    Get.offNamed(LoginView.routeName);
  }

  String _extractMessage(dio.DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final msg = data['message'];
      if (msg is String && msg.isNotEmpty) return msg;
    }
    if (e.response?.statusCode == 409) return 'Имэйл бүртгэлтэй байна';
    return 'Бүртгүүлэхэд алдаа гарлаа';
  }

  String _extractMessageFromException(Exception e) {
    final s = e.toString();
    if (s.contains('409') || s.contains('бүртгэлтэй')) return 'Имэйл бүртгэлтэй байна';
    return 'Бүртгүүлэхэд алдаа гарлаа';
  }
}
