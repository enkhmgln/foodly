import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/core/constants/constant.dart';
import '/screens/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appName,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
