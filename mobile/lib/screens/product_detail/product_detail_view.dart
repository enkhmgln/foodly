import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/screens/product_detail/product_detail_controller.dart';
import '/screens/product_detail/product_detail_widgets.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  static const String routeName = '/product/detail';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppAppBar(titleText: 'Бүтээгдэхүүн'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoading();
        }
        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  AppButtonWidget(
                    model: AppButtonModel(
                      label: 'Буцах',
                      type: AppButtonType.text,
                      size: AppButtonSize.medium,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          );
        }
        final p = controller.product.value;
        if (p == null) {
          return const Center(child: Text('Бүтээгдэхүүн олдсонгүй'));
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: p.imageUrl != null && p.imageUrl!.isNotEmpty
                      ? Image.network(p.imageUrl!, fit: BoxFit.cover)
                      : Icon(
                          Icons.image_not_supported_outlined,
                          size: 48,
                          color: AppColors.textSecondary,
                        ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                p.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                p.brand,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ScoreCircle(score: p.score, grade: p.grade),
              ),
              const SizedBox(height: 24),
              if (p.issueTags.isNotEmpty) ...[
                Wrap(
                  children: p.issueTags
                      .map((tag) => IssueTagChip(label: tag))
                      .toList(),
                ),
                const SizedBox(height: 20),
              ],
              Text(
                p.summary,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Илүү сайн сонголтууд',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Одоогоор сонголт байхгүй',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
