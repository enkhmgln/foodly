import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/screens/auth/onboarding/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: controller.onSkip,
                child: Text(
                  'Алгасах',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                children: [
                  _OnboardingPage(
                    icon: Icons.qr_code_scanner,
                    title: 'Бүтээгдэхүүн скан хий',
                    subtitle:
                        'Баркод уншуулж бүтээгдэхүүний мэдээллийг шууд аваарай.',
                  ),
                  _OnboardingPage(
                    icon: Icons.health_and_safety,
                    title: 'Эрүүл мэндийн үнэлгээ',
                    subtitle:
                        'Энгийн оноо болон дүгнэлтээр бүтээгдэхүүний эрүүл мэндийг харна уу.',
                  ),
                  _OnboardingPage(
                    icon: Icons.thumb_up,
                    title: 'Илүү сайн сонголт',
                    subtitle:
                        'Илүү эрүүл сонголтуудыг олж, зөв шийдэл гаргаарай.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Obx(() => AppPageIndicator(
                  currentIndex: controller.currentPage.value,
                  pageCount: OnboardingController.totalPages,
                )),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Obx(() {
                final isLast =
                    controller.currentPage.value ==
                    OnboardingController.totalPages - 1;
                final btnModel = AppButtonModel(
                  label: isLast ? 'Эхлэх' : 'Дараах',
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  isExpanded: true,
                );
                return AppButtonWidget(
                  model: btnModel,
                  onPressed: isLast
                      ? controller.onGetStarted
                      : controller.nextPage,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 64, color: AppColors.primary),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
