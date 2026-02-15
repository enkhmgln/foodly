import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/components/_.dart';
import '/screens/auth/signup/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppAppBar(titleText: 'Бүртгүүлэх'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            AppTextFieldWidget(model: controller.emailModel),
            const SizedBox(height: 16),
            AppTextFieldWidget(model: controller.nameModel),
            const SizedBox(height: 16),
            AppTextFieldWidget(model: controller.passwordModel),
            const SizedBox(height: 16),
            AppTextFieldWidget(model: controller.confirmPasswordModel),
            const SizedBox(height: 16),
            Obx(
              () {
                final btnModel = AppButtonModel(
                  label: 'Бүртгүүлэх',
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  isLoading: controller.isLoading.value,
                  isExpanded: true,
                );
                return AppButtonWidget(
                  model: btnModel,
                  onPressed: controller.signUp,
                );
              },
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: controller.goToLogin,
              child: const Text('Нэвтрэх'),
            ),
          ],
        ),
      ),
    );
  }
}
