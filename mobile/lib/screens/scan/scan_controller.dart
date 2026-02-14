import 'package:get/get.dart';
import 'package:foodly/client/api/product_api.dart';
import 'package:foodly/screens/product_detail/_.dart';

class ScanController extends GetxController {
  final ProductApi _productApi = Get.find<ProductApi>();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  bool _hasHandledBarcode = false;

  Future<void> onBarcodeDetected(String barcode) async {
    if (_hasHandledBarcode) return;
    _hasHandledBarcode = true;

    try {
      isLoading.value = true;
      errorMessage.value = '';
      final product = await _productApi.getProductByBarcode(barcode);
      if (product != null) {
        Get.offNamed(ProductDetailView.routeName, arguments: product);
      } else {
        Get.snackbar(
          'Product not found',
          'No product found for this barcode.',
          snackPosition: SnackPosition.BOTTOM,
        );
        _hasHandledBarcode = false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      _hasHandledBarcode = false;
    } finally {
      isLoading.value = false;
    }
  }

  void resetHandled() {
    _hasHandledBarcode = false;
  }
}
