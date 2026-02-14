import 'package:get/get.dart';
import 'package:foodly/client/api/product_api.dart';
import 'package:foodly/client/models/product_model.dart';
import 'package:foodly/screens/product_detail/_.dart';

class SearchController extends GetxController {
  final ProductApi _productApi = Get.find<ProductApi>();

  final RxString searchQuery = ''.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(searchQuery, (_) => _search(), time: const Duration(milliseconds: 300));
  }

  Future<void> _search() async {
    final q = searchQuery.value.trim();
    if (q.isEmpty) {
      products.clear();
      errorMessage.value = '';
      return;
    }
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final list = await _productApi.searchProducts(q);
      products.value = list;
    } catch (e) {
      errorMessage.value = e.toString();
      products.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void onProductTap(ProductModel product) {
    Get.toNamed(ProductDetailView.routeName, arguments: product);
  }
}
