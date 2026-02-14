import 'package:get/get.dart';
import 'package:foodly/client/api/product_api.dart';
import 'package:foodly/screens/scan/scan_controller.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductApi>(() => ProductApi(), fenix: true);
    Get.lazyPut<ScanController>(() => ScanController());
  }
}
