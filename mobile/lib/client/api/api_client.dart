import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '/client/api/api_config.dart';
import '/core/services/auth_service.dart';

class ApiClient extends GetxService {
  late final dio.Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = dio.Dio(
      dio.BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: {'Accept': 'application/json'},
      ),
    );
    _dio.interceptors.add(_AuthInterceptor());
    if (kDebugMode) {
      _dio.interceptors.add(
        dio.LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Future<dio.Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }

  Future<dio.Response<T>> post<T>(String path, {dynamic data}) async {
    return _dio.post<T>(path, data: data);
  }
}

class _AuthInterceptor extends dio.Interceptor {
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
    final path = options.path;
    if (path.contains('/auth/login') || path.contains('/auth/signup')) {
      handler.next(options);
      return;
    }
    if (Get.isRegistered<AuthService>()) {
      final token = Get.find<AuthService>().getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }
}
