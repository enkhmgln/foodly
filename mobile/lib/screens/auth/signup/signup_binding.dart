import 'package:get/get.dart';
import 'package:foodly/client/api/auth_api.dart';
import 'package:foodly/screens/auth/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthApi>(() => AuthApi(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
