import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/client/api/user_api.dart';
import '/components/_.dart';
import '/core/constants/config.dart';
import '/core/notification/fcm_registration_manager.dart';
import '/core/shared/store_manager.dart';
import '/core/shared/user_manager.dart';
import '/core/utils/validator.dart';
import '/screens/auth/signup/_.dart';
import '/screens/home/home/_.dart';

class LoginController extends GetxController {
  final UserApi _userApi = UserApi();

  final emailModel = AppTextFieldModel(
    label: 'Имэйл',
    hint: 'имэйл@жишээ.com',
    keyboardType: TextInputType.emailAddress,
    validators: [ValidatorType.notEmpty, ValidatorType.email],
  );

  final passwordModel = AppTextFieldModel(
    label: 'Нууц үг',
    obscureText: true,
    keyboardType: TextInputType.visiblePassword,
    validators: [ValidatorType.notEmpty, ValidatorType.password],
  );

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailModel.dispose();
    passwordModel.dispose();
    super.onClose();
  }

  void _runValidation() {
    if (emailModel.validators != null && emailModel.validators!.isNotEmpty) {
      final r = Validator(
        validations: emailModel.validators!,
      ).isValid(emailModel.value);
      emailModel.errorText.value = r.$2;
    }
    if (passwordModel.validators != null &&
        passwordModel.validators!.isNotEmpty) {
      final r = Validator(
        validations: passwordModel.validators!,
      ).isValid(passwordModel.value);
      passwordModel.errorText.value = r.$2;
    }
  }

  Future<void> login() async {
    Get.focusScope?.unfocus();
    _runValidation();
    if (!emailModel.isValid || !passwordModel.isValid) return;

    final e = emailModel.value.trim();
    final p = passwordModel.value;
    await FcmRegistrationManager.shared.ensureToken();
    final fcmToken = UserManager.fcmToken;
    isLoading.value = true;
    final result = await _userApi.login(
      email: e,
      password: p,
      fcmToken: fcmToken.isNotEmpty ? fcmToken : null,
    );
    if (result.isSuccess) {
      final data = result.dataOrNull;
      if (data != null) {
        await UserStoreManager.shared.write(kToken, data.token);
        await UserStoreManager.shared.write(kUser, data.user.toJson());
        Get.offAllNamed(HomeView.routeName);
      }
    } else {
      AppToast.showError(result.message);
    }
    isLoading.value = false;
  }

  void goToSignUp() {
    Get.toNamed(SignupView.routeName);
  }
}
