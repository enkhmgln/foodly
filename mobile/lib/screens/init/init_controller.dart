import 'package:get/get.dart';
import '/core/services/auth_service.dart';
import '/core/storage/onboarding_storage.dart';
import '/screens/auth/onboarding/_.dart';
import '/screens/auth/login/_.dart';
import '/screens/home/home/_.dart';

class InitController extends GetxController {
  final OnboardingStorage _onboardingStorage = Get.find<OnboardingStorage>();
  final AuthService _authService = Get.find<AuthService>();

  final RxBool isReady = false.obs;

  @override
  void onReady() {
    super.onReady();
    _resolveInitialRoute();
  }

  Future<void> _resolveInitialRoute() async {
    await _authService.tokenLoaded;
    await Future.delayed(const Duration(milliseconds: 300));

    final hasSeenOnboarding = await _onboardingStorage.hasSeenOnboarding();
    if (!hasSeenOnboarding) {
      Get.offAllNamed(OnboardingView.routeName);
      return;
    }

    if (_authService.getToken() != null &&
        _authService.getToken()!.isNotEmpty) {
      Get.offAllNamed(HomeView.routeName);
      return;
    }

    Get.offAllNamed(LoginView.routeName);
  }
}
