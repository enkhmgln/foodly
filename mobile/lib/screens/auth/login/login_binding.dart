import 'package:get/get.dart';
import '/client/api/auth_api.dart';
import '/screens/auth/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApi>(() => AuthApi(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
