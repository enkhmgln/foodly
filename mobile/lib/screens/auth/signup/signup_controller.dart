import 'package:get/get.dart';
import '/core/services/auth_service.dart';
import '/screens/auth/login/_.dart';

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

    isLoading.value = true;
    errorMessage.value = '';
    final result = await _authService.signUp(e, p, name: n.isEmpty ? null : n);
    if (result.isFailure) {
      errorMessage.value = result.message;
      Get.snackbar('Алдаа', result.message);
    }
    isLoading.value = false;
  }

  void goToLogin() {
    Get.offNamed(LoginView.routeName);
  }
}
