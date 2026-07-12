import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_radius.dart';
import 'package:quote/core/tokens/app_spacing.dart';

class AppSnackbar {
  AppSnackbar._();

  static const Duration _defaultDuration = Duration(seconds: 3);

  static void showSuccess(
    BuildContext context, {
    required String message,
    Duration duration = _defaultDuration,
    SnackBarAction? action,
  }) {
    _show(
      context,
      message: message,
      backgroundColor:
          Theme.of(context).colorScheme.primaryContainer,
      foregroundColor:
          Theme.of(context).colorScheme.onPrimaryContainer,
      duration: duration,
      action: action,
    );
  }

  static void showError(
    BuildContext context, {
    required String message,
    Duration duration = _defaultDuration,
    SnackBarAction? action,
  }) {
    _show(
      context,
      message: message,
      backgroundColor:
          Theme.of(context).colorScheme.errorContainer,
      foregroundColor:
          Theme.of(context).colorScheme.onErrorContainer,
      duration: duration,
      action: action,
    );
  }

  static void showWarning(
    BuildContext context, {
    required String message,
    Duration duration = _defaultDuration,
    SnackBarAction? action,
  }) {
    _show(
      context,
      message: message,
      backgroundColor:
          Theme.of(context).colorScheme.tertiaryContainer,
      foregroundColor:
          Theme.of(context).colorScheme.onTertiaryContainer,
      duration: duration,
      action: action,
    );
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    Duration duration = _defaultDuration,
    SnackBarAction? action,
  }) {
    _show(
      context,
      message: message,
      backgroundColor:
          Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor:
          Theme.of(context).colorScheme.onSecondaryContainer,
      duration: duration,
      action: action,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required Color foregroundColor,
    required Duration duration,
    SnackBarAction? action,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSpacing.md),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }
}