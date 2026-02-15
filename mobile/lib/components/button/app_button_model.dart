import 'package:flutter/material.dart';
import '/app/theme/app_colors.dart';

enum AppButtonType {
  primary(
    enabledBackgroundColor: AppColors.primary,
    enabledForegroundColor: Colors.white,
    enabledBorderColor: Colors.transparent,
    disabledBackgroundColor: AppColors.surface,
    disabledForegroundColor: AppColors.textSecondary,
    disabledBorderColor: Colors.transparent,
  ),
  outline(
    enabledBackgroundColor: Colors.transparent,
    enabledForegroundColor: AppColors.primary,
    enabledBorderColor: AppColors.primary,
    disabledBackgroundColor: Colors.transparent,
    disabledForegroundColor: AppColors.textSecondary,
    disabledBorderColor: AppColors.surface,
  ),
  text(
    enabledBackgroundColor: Colors.transparent,
    enabledForegroundColor: AppColors.primary,
    enabledBorderColor: Colors.transparent,
    disabledBackgroundColor: Colors.transparent,
    disabledForegroundColor: AppColors.textSecondary,
    disabledBorderColor: Colors.transparent,
  );

  final Color enabledBackgroundColor;
  final Color enabledForegroundColor;
  final Color enabledBorderColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final Color disabledBorderColor;

  const AppButtonType({
    required this.enabledBackgroundColor,
    required this.enabledForegroundColor,
    required this.enabledBorderColor,
    required this.disabledBackgroundColor,
    required this.disabledForegroundColor,
    required this.disabledBorderColor,
  });
}

enum AppButtonSize {
  large(height: 56, iconSize: 24, fontSize: 18),
  medium(height: 48, iconSize: 24, fontSize: 16),
  small(height: 40, iconSize: 20, fontSize: 14);

  final double height;
  final double iconSize;
  final double fontSize;

  const AppButtonSize({
    required this.height,
    required this.iconSize,
    required this.fontSize,
  });
}

class AppButtonModel {
  AppButtonModel({
    required this.label,
    required this.type,
    required this.size,
    this.isLoading = false,
    this.isEnabled = true,
    this.isExpanded = true,
    this.borderRadius = 12,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final AppButtonType type;
  final AppButtonSize size;
  bool isLoading;
  bool isEnabled;
  final bool isExpanded;
  final double borderRadius;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  Color get foreColor =>
      isEnabled ? type.enabledForegroundColor : type.disabledForegroundColor;
  Color get backColor =>
      isEnabled ? type.enabledBackgroundColor : type.disabledBackgroundColor;
  Color get borderColor =>
      isEnabled ? type.enabledBorderColor : type.disabledBorderColor;
}
