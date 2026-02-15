import 'package:get/get.dart';
import '/client/api/product_api.dart';
import '/screens/product_detail/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductApi>(() => ProductApi(), fenix: true);
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}
