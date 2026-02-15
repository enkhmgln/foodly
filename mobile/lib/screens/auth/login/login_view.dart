import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/components/_.dart';
import '/screens/auth/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppAppBar(titleText: 'Нэвтрэх'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            AppTextFieldWidget(
              model: controller.emailModel,
            ),
            const SizedBox(height: 16),
            AppTextFieldWidget(
              model: controller.passwordModel,
            ),
            const SizedBox(height: 16),
            Obx(
              () {
                final btnModel = AppButtonModel(
                  label: 'Нэвтрэх',
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  isLoading: controller.isLoading.value,
                  isExpanded: true,
                );
                return AppButtonWidget(
                  model: btnModel,
                  onPressed: controller.login,
                );
              },
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: controller.goToSignUp,
              child: const Text('Бүртгүүлэх'),
            ),
          ],
        ),
      ),
    );
  }
}
