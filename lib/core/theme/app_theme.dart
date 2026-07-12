import 'package:flutter/material.dart';
import 'package:quote/core/theme/app_theme_palette.dart';
import 'package:quote/core/tokens/app_radius.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() => fromPalette(AppThemePalettes.light);

  static ThemeData dark() => fromPalette(AppThemePalettes.dark);

  static ThemeData fromPalette(AppThemePalette palette) {
    final baseScheme = ColorScheme.fromSeed(
      seedColor: palette.primary,
      brightness: palette.brightness,
    );

    final colorScheme = baseScheme.copyWith(
      primary: palette.primary,
      secondary: palette.secondary,
      surface: palette.surface,
      error: palette.error,
      onSurface: palette.textPrimary,
      outline: palette.border,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: palette.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: palette.background,

      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: palette.background,
        foregroundColor: palette.textPrimary,
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
      ),
    );
  }
}