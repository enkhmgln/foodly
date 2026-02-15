import 'package:get/get.dart';
import '/client/api/product_api.dart';
import '/screens/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductApi>(() => ProductApi(), fenix: true);
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
