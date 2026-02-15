import 'package:get/get.dart';
import 'package:foodly/client/api/auth_api.dart';
import 'package:foodly/screens/auth/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApi>(() => AuthApi(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
