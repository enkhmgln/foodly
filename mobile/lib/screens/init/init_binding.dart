import 'package:get/get.dart';
import 'package:foodly/screens/init/init_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitController>(() => InitController());
  }
}
