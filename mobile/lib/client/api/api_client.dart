import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:foodly/client/api/api_config.dart';

class ApiClient extends GetxService {
  late final dio.Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = dio.Dio(dio.BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: ApiConfig.connectTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      headers: {'Accept': 'application/json'},
    ));
    if (kDebugMode) {
      _dio.interceptors.add(dio.LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }

  Future<dio.Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }

  Future<dio.Response<T>> post<T>(
    String path, {
    dynamic data,
  }) async {
    return _dio.post<T>(path, data: data);
  }
}
