import 'package:flutter/material.dart';
import '/app/theme/app_colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.size = 30,
    this.strokeWidth = 2,
    this.color,
  });

  final double size;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
