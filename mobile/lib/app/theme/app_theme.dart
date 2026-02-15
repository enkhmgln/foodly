import 'package:flutter/material.dart';
import '/app/theme/app_colors.dart';

abstract class AppTheme {
  AppTheme._();

  static const String _fontFamily = 'Gilroy';

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: _fontFamily,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: _fontFamily),
        displayMedium: TextStyle(fontFamily: _fontFamily),
        displaySmall: TextStyle(fontFamily: _fontFamily),
        headlineLarge: TextStyle(fontFamily: _fontFamily),
        headlineMedium: TextStyle(fontFamily: _fontFamily),
        headlineSmall: TextStyle(fontFamily: _fontFamily),
        titleLarge: TextStyle(fontFamily: _fontFamily),
        titleMedium: TextStyle(fontFamily: _fontFamily),
        titleSmall: TextStyle(fontFamily: _fontFamily),
        bodyLarge: TextStyle(fontFamily: _fontFamily),
        bodyMedium: TextStyle(fontFamily: _fontFamily),
        bodySmall: TextStyle(fontFamily: _fontFamily),
        labelLarge: TextStyle(fontFamily: _fontFamily),
        labelMedium: TextStyle(fontFamily: _fontFamily),
        labelSmall: TextStyle(fontFamily: _fontFamily),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        surface: AppColors.background,
        onSurface: AppColors.textPrimary,
        error: AppColors.scoreBad,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
