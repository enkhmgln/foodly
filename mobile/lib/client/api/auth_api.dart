import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:foodly/client/api/api_client.dart';
import 'package:foodly/client/models/auth_response_model.dart';
import 'package:foodly/client/models/user_model.dart';

class AuthApi {
  final ApiClient _apiClient = Get.find<ApiClient>();

  static Map<String, dynamic>? _dataMap(dio.Response response) {
    final body = response.data;
    if (body == null || body is! Map<String, dynamic>) return null;
    final data = body['data'];
    if (data == null || data is! Map<String, dynamic>) return null;
    return data;
  }

  Future<AuthResponseModel?> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await _apiClient.post(
        '/api/auth/signup',
        data: {
          'email': email.trim().toLowerCase(),
          'password': password,
          if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
        },
      );
      final data = _dataMap(response);
      if (data == null) return null;
      return AuthResponseModel.fromJson(data);
    } on dio.DioException {
      rethrow;
    }
  }

  Future<AuthResponseModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        '/api/auth/login',
        data: {
          'email': email.trim().toLowerCase(),
          'password': password,
        },
      );
      final data = _dataMap(response);
      if (data == null) return null;
      return AuthResponseModel.fromJson(data);
    } on dio.DioException {
      rethrow;
    }
  }

  Future<UserModel?> getMe() async {
    try {
      final response = await _apiClient.get('/api/users/me');
      final data = _dataMap(response);
      if (data == null) return null;
      return UserModel.fromJson(data);
    } on dio.DioException catch (e) {
      if (e.response?.statusCode == 401) return null;
      rethrow;
    }
  }
}
