import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/screens/search/search_controller.dart' as search;
import '/screens/search/search_widgets.dart';

class SearchView extends GetView<search.SearchController> {
  const SearchView({super.key});

  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        titleText: 'Хайлт',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Бүтээгдэхүүн хайх...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Obx(() {
                  if (controller.searchQuery.value.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      controller.searchQuery.value = '';
                      controller.products.clear();
                      controller.errorMessage.value = '';
                    },
                  );
                }),
              ),
              onChanged: (value) => controller.searchQuery.value = value,
            ),
          ),
        ),
      ),
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
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  AppButtonWidget(
                    model: AppButtonModel(
                      label: 'Дахин оролдох',
                      type: AppButtonType.primary,
                      size: AppButtonSize.medium,
                    ),
                    onPressed: () => controller.searchQuery.refresh(),
                  ),
                ],
              ),
            ),
          );
        }
        if (controller.searchQuery.value.trim().isEmpty) {
          return Center(
            child: Text(
              'Бүтээгдэхүүн хайхын тулд бичнэ үү',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
          );
        }
        if (controller.products.isEmpty) {
          return Center(
            child: Text(
              'Бүтээгдэхүүн олдсонгүй',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ProductListTile(
              product: product,
              onTap: () => controller.onProductTap(product),
            );
          },
        );
      }),
    );
  }
}
