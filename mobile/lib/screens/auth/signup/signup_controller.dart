import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/client/api/user_api.dart';
import '/components/_.dart';
import '/core/constants/config.dart';
import '/core/notification/fcm_registration_manager.dart';
import '/core/shared/store_manager.dart';
import '/core/shared/user_manager.dart';
import '/core/utils/validator.dart';
import '/screens/auth/login/_.dart';
import '/screens/home/home/_.dart';

class SignupController extends GetxController {
  final UserApi _userApi = UserApi();

  final emailModel = AppTextFieldModel(
    label: 'Имэйл',
    hint: 'имэйл@жишээ.com',
    keyboardType: TextInputType.emailAddress,
    validators: [ValidatorType.notEmpty, ValidatorType.email],
  );

  final nameModel = AppTextFieldModel(
    label: 'Нэр',
    hint: 'Нэрээ оруулна уу',
    validators: [ValidatorType.notEmpty],
  );

  final passwordModel = AppTextFieldModel(
    label: 'Нууц үг',
    hint: 'Хамгийн багадаа 8 тэмдэгт',
    obscureText: true,
    keyboardType: TextInputType.visiblePassword,
    validators: [ValidatorType.notEmpty, ValidatorType.password],
  );

  final confirmPasswordModel = AppTextFieldModel(
    label: 'Нууц үг давтах',
    obscureText: true,
    keyboardType: TextInputType.visiblePassword,
    validators: [ValidatorType.notEmpty, ValidatorType.password],
  );

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    emailModel.dispose();
    nameModel.dispose();
    passwordModel.dispose();
    confirmPasswordModel.dispose();
    super.onClose();
  }

  void _runValidation() {
    if (emailModel.validators != null && emailModel.validators!.isNotEmpty) {
      final r = Validator(
        validations: emailModel.validators!,
      ).isValid(emailModel.value);
      emailModel.errorText.value = r.$2;
    }
    if (nameModel.validators != null && nameModel.validators!.isNotEmpty) {
      final r = Validator(
        validations: nameModel.validators!,
      ).isValid(nameModel.value);
      nameModel.errorText.value = r.$2;
    }
    if (passwordModel.validators != null &&
        passwordModel.validators!.isNotEmpty) {
      final r = Validator(
        validations: passwordModel.validators!,
      ).isValid(passwordModel.value);
      passwordModel.errorText.value = r.$2;
    }
    if (confirmPasswordModel.validators != null &&
        confirmPasswordModel.validators!.isNotEmpty) {
      final r = Validator(
        validations: confirmPasswordModel.validators!,
      ).isValid(confirmPasswordModel.value);
      confirmPasswordModel.errorText.value = r.$2;
    }
  }

  Future<void> signUp() async {
    Get.focusScope?.unfocus();
    _runValidation();

    final p = passwordModel.value;
    final cp = confirmPasswordModel.value;
    if (p != cp) {
      confirmPasswordModel.errorText.value = 'Нууц үг тохирохгүй байна';
      return;
    }
    if (!emailModel.isValid ||
        !nameModel.isValid ||
        !passwordModel.isValid ||
        !confirmPasswordModel.isValid)
      return;

    final e = emailModel.value.trim();
    final n = nameModel.value.trim();
    await FcmRegistrationManager.shared.ensureToken();
    final fcmToken = UserManager.fcmToken;
    isLoading.value = true;
    final result = await _userApi.signUp(
      email: e,
      password: p,
      name: n,
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

  void goToLogin() {
    Get.offNamed(LoginView.routeName);
  }
}
