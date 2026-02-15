import 'package:get/get.dart';
import '/client/api/api_client.dart';
import '/client/api/api_result.dart';
import '/client/api/response_sender.dart';
import '/client/models/product_model.dart';

class ProductApi {
  final ResponseSender _sender = ResponseSender(Get.find<ApiClient>());

  Future<ApiResult<ProductModel?>> getProductByBarcode(String barcode) async {
    return _sender.get(
      '/api/products/barcode/$barcode',
      fromJson: (d) =>
          d == null ? null : ProductModel.fromJson(d as Map<String, dynamic>),
    );
  }

  Future<ApiResult<List<ProductModel>>> searchProducts(String query) async {
    if (query.trim().isEmpty) {
      return const ApiSuccess<List<ProductModel>>([]);
    }
    return _sender.get(
      '/api/products/search',
      queryParameters: {'q': query.trim()},
      fromJson: (d) => (d as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<ProductModel?>> getProductById(String id) async {
    return _sender.get(
      '/api/products/$id',
      fromJson: (d) =>
          d == null ? null : ProductModel.fromJson(d as Map<String, dynamic>),
    );
  }
}
