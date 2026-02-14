abstract class ApiConstants {
  ApiConstants._();

  /// Android emulator: use 10.0.2.2 to reach host localhost.
  /// iOS simulator / physical device: use your machine IP or a deployed API URL.
  static const String baseUrl = 'http://10.0.2.2:8080';
}
