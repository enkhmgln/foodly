import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodly/app/theme/app_colors.dart';
import 'package:foodly/client/models/product_model.dart';
import 'package:foodly/screens/product_detail/_.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
    required this.onTap,
  });

  final ProductModel product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.scoreColorForGrade(
      ProductModel.gradeLabel(product.grade),
    );
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: product.imageUrl != null && product.imageUrl!.isNotEmpty
              ? Image.network(product.imageUrl!, fit: BoxFit.cover)
              : Icon(Icons.inventory_2_outlined, color: AppColors.textSecondary),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          product.brand,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${product.score}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 16,
            ),
          ),
        ),
        onTap: () => Get.toNamed(
          ProductDetailView.routeName,
          arguments: product,
        ),
      ),
    );
  }
}
