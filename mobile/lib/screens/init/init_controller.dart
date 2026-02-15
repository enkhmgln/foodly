import 'package:get/get.dart';
import '/core/shared/user_manager.dart';
import '/screens/auth/onboarding/_.dart';
import '/screens/auth/login/_.dart';
import '/screens/home/home/_.dart';

class InitController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _resolveInitialRoute();
  }

  Future<void> _resolveInitialRoute() async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (!UserManager.isOnboardingCompleted) {
      Get.offAllNamed(OnboardingView.routeName);
      return;
    }

    if (UserManager.isLogged) {
      Get.offAllNamed(HomeView.routeName);
      return;
    }

    Get.offAllNamed(LoginView.routeName);
  }
}
