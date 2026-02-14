import 'package:flutter/material.dart';

/// Yuka-style color palette for Foodly.
abstract class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryDark = Color(0xFF388E3C);
  static const Color primaryLight = Color(0xFF81C784);

  // Score grades (Yuka semantic colors)
  static const Color scoreBad = Color(0xFFE53935);
  static const Color scoreMediocre = Color(0xFFFF9800);
  static const Color scoreGood = Color(0xFF8BC34A);
  static const Color scoreExcellent = Color(0xFF4CAF50);

  // Surfaces & text
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFAFAFA);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  static Color scoreColorForGrade(String grade) {
    switch (grade.toLowerCase()) {
      case 'bad':
        return scoreBad;
      case 'mediocre':
        return scoreMediocre;
      case 'good':
        return scoreGood;
      case 'excellent':
        return scoreExcellent;
      default:
        return scoreMediocre;
    }
  }
}
