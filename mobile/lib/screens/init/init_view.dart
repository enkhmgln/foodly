import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodly/app/theme/app_colors.dart';
import 'package:foodly/core/constants/app_constants.dart';
import 'package:foodly/screens/init/init_controller.dart';

class InitView extends GetView<InitController> {
  const InitView({super.key});

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
              AppConstants.appName,
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
