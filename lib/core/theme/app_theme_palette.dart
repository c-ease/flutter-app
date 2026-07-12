import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_colors.dart';

@immutable
class AppThemePalette {
  const AppThemePalette({
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.success,
    required this.warning,
    required this.error,
  });

  final Brightness brightness;

  final Color primary;
  final Color secondary;

  final Color background;
  final Color surface;

  final Color textPrimary;
  final Color textSecondary;

  final Color border;

  final Color success;
  final Color warning;
  final Color error;
}

class AppThemePalettes {
  AppThemePalettes._();

  static const AppThemePalette light = AppThemePalette(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    secondary: AppColors.lightSecondary,
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    textPrimary: AppColors.lightTextPrimary,
    textSecondary: AppColors.lightTextSecondary,
    border: AppColors.lightBorder,
    success: AppColors.lightSuccess,
    warning: AppColors.lightWarning,
    error: AppColors.lightError,
  );

  static const AppThemePalette dark = AppThemePalette(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    secondary: AppColors.darkSecondary,
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    textPrimary: AppColors.darkTextPrimary,
    textSecondary: AppColors.darkTextSecondary,
    border: AppColors.darkBorder,
    success: AppColors.darkSuccess,
    warning: AppColors.darkWarning,
    error: AppColors.darkError,
  );
}