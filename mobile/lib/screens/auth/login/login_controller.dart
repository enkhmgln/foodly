import 'package:get/get.dart';
import '/client/api/user_api.dart';
import '/core/constants/constant.dart';
import '/core/shared/store_manager.dart';
import '/screens/auth/signup/_.dart';
import '/screens/home/home/_.dart';

class LoginController extends GetxController {
  final UserApi _userApi = UserApi();

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
    final result = await _userApi.login(email: e, password: p);
    if (result.isSuccess) {
      final data = result.dataOrNull;
      if (data != null) {
        await UserStoreManager.shared.write(kToken, data.token);
        await UserStoreManager.shared.write(kUser, data.user.toJson());
        Get.offAllNamed(HomeView.routeName);
      }
    } else {
      errorMessage.value = result.message;
      Get.snackbar('Алдаа', result.message);
    }
    isLoading.value = false;
  }

  void goToSignUp() {
    Get.toNamed(SignupView.routeName);
  }
}
