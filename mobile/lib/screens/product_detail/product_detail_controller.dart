import 'package:get/get.dart';
import 'package:foodly/client/api/product_api.dart';
import 'package:foodly/client/models/product_model.dart';

class ProductDetailController extends GetxController {
  final ProductApi _productApi = Get.find<ProductApi>();

  final Rx<ProductModel?> product = Rx<ProductModel?>(null);
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is ProductModel) {
      product.value = args;
      isLoading.value = false;
    } else if (args is String) {
      loadProductById(args);
    } else {
      isLoading.value = false;
      errorMessage.value = 'No product data';
    }
  }

  Future<void> loadProductById(String id) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final p = await _productApi.getProductById(id);
      product.value = p;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
