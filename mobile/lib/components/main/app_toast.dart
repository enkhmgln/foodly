import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/theme/app_colors.dart';

/// App-level toast (snackbar) with consistent styling.
abstract class AppToast {
  AppToast._();

  static void show(
    String message, {
    String? title,
    bool isError = false,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
  }) {
    final backgroundColor = isError ? AppColors.scoreBad : AppColors.textPrimary;
    Get.snackbar(
      title ?? '',
      message,
      snackPosition: position,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: duration,
      titleText: title != null && title.isNotEmpty
          ? Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            )
          : const SizedBox.shrink(),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    );
  }

  static void showError(String message, {String? title}) {
    show(
      message,
      title: title ?? 'Алдаа',
      isError: true,
    );
  }

  static void showSuccess(String message, {String? title}) {
    show(
      message,
      title: title ?? 'Амжилттай',
      isError: false,
    );
  }
}
