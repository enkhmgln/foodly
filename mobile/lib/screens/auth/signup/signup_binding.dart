import 'package:get/get.dart';
import '/client/api/auth_api.dart';
import '/screens/auth/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApi>(() => AuthApi(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
