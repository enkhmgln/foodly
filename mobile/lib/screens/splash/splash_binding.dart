import 'package:get/get.dart';
import '/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: false);
  }
}
