import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constants/config.dart';
import '/core/shared/store_manager.dart';
import '/screens/auth/login/_.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  static const int totalPages = 3;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  Future<void> onGetStarted() async {
    await DeviceStoreManager.shared.write(kOnboardingCompleted, true);
    Get.offAllNamed(LoginView.routeName);
  }

  Future<void> onSkip() async {
    await DeviceStoreManager.shared.write(kOnboardingCompleted, true);
    Get.offAllNamed(LoginView.routeName);
  }

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
