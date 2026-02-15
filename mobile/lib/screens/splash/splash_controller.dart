import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToInitial();
  }

  Future<void> _goToInitial() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final route = AppPages.initial;
    Get.offAllNamed(route);
  }
}
