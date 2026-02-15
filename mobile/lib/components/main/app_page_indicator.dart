import 'package:flutter/material.dart';
import '/app/theme/app_colors.dart';

class AppPageIndicator extends StatelessWidget {
  const AppPageIndicator({
    super.key,
    required this.currentIndex,
    required this.pageCount,
    this.activeColor,
    this.inactiveColor,
    this.activeWidth = 24,
    this.inactiveWidth = 8,
    this.height = 8,
    this.spacing = 4,
  });

  final int currentIndex;
  final int pageCount;
  final Color? activeColor;
  final Color? inactiveColor;
  final double activeWidth;
  final double inactiveWidth;
  final double height;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final active = activeColor ?? AppColors.primary;
    final inactive = inactiveColor ?? AppColors.primary.withValues(alpha: 0.3);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          height: height,
          width: isActive ? activeWidth : inactiveWidth,
          decoration: BoxDecoration(
            color: isActive ? active : inactive,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        );
      }),
    );
  }
}
