import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/core/constants/constant.dart';
import '/screens/auth/signup/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppScaffold(
      appBar: const AppAppBar(titleText: 'Бүртгүүлэх'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 64),
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
                'Шинэ бүртгэл үүсгэх',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Доорх мэдээллээ бөглөнө үү',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              AppTextFieldWidget(model: controller.emailModel),
              const SizedBox(height: 20),
              AppTextFieldWidget(model: controller.nameModel),
              const SizedBox(height: 20),
              AppTextFieldWidget(model: controller.passwordModel),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Хамгийн багадаа 8 тэмдэгт',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AppTextFieldWidget(model: controller.confirmPasswordModel),
              const SizedBox(height: 40),
              Obx(() {
                return AppButtonWidget(
                  model: AppButtonModel(
                    label: 'Бүртгүүлэх',
                    type: AppButtonType.primary,
                    size: AppButtonSize.large,
                    isLoading: controller.isLoading.value,
                    isExpanded: true,
                  ),
                  onPressed: controller.signUp,
                );
              }),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
