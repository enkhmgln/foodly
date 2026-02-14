import 'package:flutter/material.dart';
import 'package:foodly/app/theme/app_colors.dart';
import 'package:foodly/client/models/product_model.dart';

class ScoreCircle extends StatelessWidget {
  const ScoreCircle({
    super.key,
    required this.score,
    required this.grade,
    this.size = 140,
  });

  final int score;
  final ProductGrade grade;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = _colorForGrade(grade);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.12),
        border: Border.all(color: color, width: 8),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$score',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
          Text(
            _gradeLabelMn(grade),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  static Color _colorForGrade(ProductGrade grade) {
    switch (grade) {
      case ProductGrade.bad:
        return AppColors.scoreBad;
      case ProductGrade.mediocre:
        return AppColors.scoreMediocre;
      case ProductGrade.good:
        return AppColors.scoreGood;
      case ProductGrade.excellent:
        return AppColors.scoreExcellent;
    }
  }

  static String _gradeLabelMn(ProductGrade grade) {
    switch (grade) {
      case ProductGrade.bad:
        return 'Муу';
      case ProductGrade.mediocre:
        return 'Дунд';
      case ProductGrade.good:
        return 'Сайн';
      case ProductGrade.excellent:
        return 'Маш сайн';
    }
  }
}

class IssueTagChip extends StatelessWidget {
  const IssueTagChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: AppColors.surface,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
