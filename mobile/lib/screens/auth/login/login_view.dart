import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/core/constants/constant.dart';
import '/screens/auth/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      appBar: const AppAppBar(titleText: 'Нэвтрэх', showLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              Center(
                child: Text(
                  appName,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Тавтай морилно уу',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Имэйл болон нууц үгээ оруулна уу',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              AppTextFieldWidget(model: controller.emailModel),
              const SizedBox(height: 20),
              AppTextFieldWidget(model: controller.passwordModel),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: AppButtonWidget(
                  model: AppButtonModel(
                    label: 'Нууц үгээ мартсан уу?',
                    type: AppButtonType.text,
                    size: AppButtonSize.small,
                    isExpanded: false,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 40),
              Obx(() {
                return AppButtonWidget(
                  model: AppButtonModel(
                    label: 'Нэвтрэх',
                    type: AppButtonType.primary,
                    size: AppButtonSize.large,
                    isLoading: controller.isLoading.value,
                    isExpanded: true,
                  ),
                  onPressed: controller.login,
                );
              }),
              const SizedBox(height: 16),
              AppButtonWidget(
                model: AppButtonModel(
                  label: 'Бүртгүүлэх',
                  type: AppButtonType.outline,
                  size: AppButtonSize.large,
                  isExpanded: true,
                ),
                onPressed: controller.goToSignUp,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
