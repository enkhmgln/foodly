import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/screens/auth/signup/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Бүртгүүлэх')),
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
                onChanged: (v) => controller.name.value = v,
                decoration: const InputDecoration(
                  labelText: 'Нэр (заавал биш)',
                  prefixIcon: Icon(Icons.person_outline),
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
                  hintText: 'Хамгийн багадаа 8 тэмдэгт',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => TextField(
                onChanged: (v) => controller.confirmPassword.value = v,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Нууц үг давтах',
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
                onPressed: controller.isLoading.value
                    ? null
                    : controller.signUp,
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
                    : const Text('Бүртгүүлэх'),
              ),
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
