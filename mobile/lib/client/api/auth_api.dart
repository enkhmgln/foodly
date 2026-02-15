import 'package:get/get.dart';
import '/client/api/api_client.dart';
import '/client/api/api_result.dart';
import '/client/api/response_sender.dart';
import '/client/models/auth_response_model.dart';
import '/client/models/user_model.dart';

class AuthApi {
  final ResponseSender _sender = ResponseSender(Get.find<ApiClient>());

  Future<ApiResult<AuthResponseModel>> signUp({
    required String email,
    required String password,
    String? name,
  }) async {
    return _sender.post(
      '/api/auth/signup',
      data: {
        'email': email.trim().toLowerCase(),
        'password': password,
        if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
      },
      fromJson: (d) => AuthResponseModel.fromJson(d as Map<String, dynamic>),
    );
  }

  Future<ApiResult<AuthResponseModel>> login({
    required String email,
    required String password,
  }) async {
    return _sender.post(
      '/api/auth/login',
      data: {'email': email.trim().toLowerCase(), 'password': password},
      fromJson: (d) => AuthResponseModel.fromJson(d as Map<String, dynamic>),
    );
  }

  Future<ApiResult<UserModel>> getMe() async {
    return _sender.get(
      '/api/users/me',
      fromJson: (d) => UserModel.fromJson(d as Map<String, dynamic>),
    );
  }
}
