import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/core/constants/config.dart';
import '/screens/home/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        title: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.logout,
            tooltip: 'Гарах',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              Text(
                appName,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Эрүүл мэндээ зөв сонголтоор хамгаал',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ),
              const Spacer(),
              AppButtonWidget(
                model: AppButtonModel(
                  label: 'Бүтээгдэхүүн скан хийх',
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  prefixIcon: Icons.qr_code_scanner,
                  isExpanded: true,
                ),
                onPressed: controller.onScanTap,
              ),
              const SizedBox(height: 12),
              AppButtonWidget(
                model: AppButtonModel(
                  label: 'Бүтээгдэхүүн хайх',
                  type: AppButtonType.outline,
                  size: AppButtonSize.large,
                  prefixIcon: Icons.search,
                  isExpanded: true,
                ),
                onPressed: controller.onSearchTap,
              ),
              const SizedBox(height: 32),
              Text(
                'Одоогоор скан хийгээгүй байна',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
