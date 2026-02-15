import 'package:get/get.dart';
import '/client/api/product_api.dart';
import '/screens/product_detail/_.dart';

class ScanController extends GetxController {
  final ProductApi _productApi = Get.find<ProductApi>();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  bool _hasHandledBarcode = false;

  Future<void> onBarcodeDetected(String barcode) async {
    if (_hasHandledBarcode) return;
    _hasHandledBarcode = true;

    isLoading.value = true;
    errorMessage.value = '';
    final result = await _productApi.getProductByBarcode(barcode);
    if (result.isSuccess && result.dataOrNull != null) {
      Get.offNamed(ProductDetailView.routeName, arguments: result.dataOrNull);
    } else {
      final message = result.isFailure
          ? result.message
          : 'Энэ баркодтой бүтээгдэхүүн олдсонгүй.';
      Get.snackbar(
        result.isFailure ? 'Алдаа' : 'Бүтээгдэхүүн олдсонгүй',
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
      _hasHandledBarcode = false;
    }
    isLoading.value = false;
  }

  void resetHandled() {
    _hasHandledBarcode = false;
  }
}
