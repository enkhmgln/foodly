import 'package:foodly/core/constants/api_constants.dart';

abstract class ApiConfig {
  ApiConfig._();

  static String get baseUrl => ApiConstants.baseUrl;
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
