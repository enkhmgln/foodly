import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/screens/auth/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Нэвтрэх')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Obx(
              () => TextField(
                onChanged: (v) => controller.email.value = v,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: 'Имэйл',
                  hintText: 'имэйл@жишээ.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => TextField(
                onChanged: (v) => controller.password.value = v,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Нууц үг',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => controller.errorMessage.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(
                          color: AppColors.scoreBad,
                          fontSize: 13,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Нэвтрэх'),
              ),
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
