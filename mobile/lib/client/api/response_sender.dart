import 'package:dio/dio.dart' as dio;
import '/client/api/api_client.dart';
import '/client/api/api_result.dart';

class ResponseSender {
  ResponseSender(this._apiClient);

  final ApiClient _apiClient;

  static const _defaultError = 'Алдаа гарлаа';

  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _apiClient.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );
      return _parseResponse(response, fromJson);
    } on dio.DioException catch (e) {
      return ApiFailure<T>(
        _messageFromResponse(e.response?.data),
        statusCode: e.response?.statusCode,
      );
    } on Object catch (e) {
      return ApiFailure<T>(
        e.toString().isNotEmpty ? e.toString() : _defaultError,
      );
    }
  }

  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await _apiClient.post<dynamic>(path, data: data);
      return _parseResponse(response, fromJson);
    } on dio.DioException catch (e) {
      return ApiFailure<T>(
        _messageFromResponse(e.response?.data),
        statusCode: e.response?.statusCode,
      );
    } on Object catch (e) {
      return ApiFailure<T>(
        e.toString().isNotEmpty ? e.toString() : _defaultError,
      );
    }
  }

  ApiResult<T> _parseResponse<T>(
    dio.Response<dynamic> response,
    T Function(dynamic) fromJson,
  ) {
    final body = response.data;
    if (body is! Map<String, dynamic>) {
      return ApiFailure<T>(_defaultError, statusCode: response.statusCode);
    }
    if (body['success'] == false) {
      final msg = body['message'];
      return ApiFailure<T>(
        msg is String && msg.isNotEmpty ? msg : _defaultError,
        statusCode: response.statusCode,
      );
    }
    final data = body['data'];
    try {
      return ApiSuccess<T>(fromJson(data));
    } on Object catch (e) {
      return ApiFailure<T>(
        e.toString().isNotEmpty ? e.toString() : _defaultError,
      );
    }
  }

  static String _messageFromResponse(dynamic data) {
    if (data is Map<String, dynamic>) {
      final msg = data['message'];
      if (msg is String && msg.isNotEmpty) return msg;
    }
    return _defaultError;
  }
}
