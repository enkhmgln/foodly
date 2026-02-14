import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:foodly/client/api/api_client.dart';
import 'package:foodly/client/models/product_model.dart';

class ProductApi {
  final ApiClient _apiClient = Get.find<ApiClient>();

  Future<ProductModel?> getProductByBarcode(String barcode) async {
    try {
      final response = await _apiClient.get(
        '/api/products/barcode/$barcode',
      );
      if (response.data == null) return null;
      return ProductModel.fromJson(response.data as Map<String, dynamic>);
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    if (query.trim().isEmpty) return [];
    try {
      final response = await _apiClient.get(
        '/api/products/search',
        queryParameters: {'q': query.trim()},
      );
      final list = response.data as List<dynamic>?;
      if (list == null) return [];
      return list
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on dio.DioException {
      return [];
    }
  }

  Future<ProductModel?> getProductById(String id) async {
    try {
      final response = await _apiClient.get('/api/products/$id');
      if (response.data == null) return null;
      return ProductModel.fromJson(response.data as Map<String, dynamic>);
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }
}
