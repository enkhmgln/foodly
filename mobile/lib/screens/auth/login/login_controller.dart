import 'package:get/get.dart';
import '/core/services/auth_service.dart';
import '/screens/auth/signup/_.dart';

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
    isLoading.value = true;
    errorMessage.value = '';
    final result = await _authService.login(e, p);
    if (result.isFailure) {
      errorMessage.value = result.message;
      Get.snackbar('Алдаа', result.message);
    }
    isLoading.value = false;
  }

  void goToSignUp() {
    Get.toNamed(SignupView.routeName);
  }
}
