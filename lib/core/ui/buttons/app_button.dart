import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_radius.dart';
import 'package:quote/core/tokens/app_spacing.dart';
import 'package:quote/core/ui/buttons/app_button_size.dart';
import 'package:quote/core/ui/buttons/app_button_variant.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.leading,
    this.trailing,
    this.tooltip,
    this.loading = false,
    this.expanded = true,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
  });

  final String label;
  final VoidCallback? onPressed;

  final Widget? leading;
  final Widget? trailing;

  final String? tooltip;

  final bool loading;
  final bool expanded;

  final AppButtonVariant variant;
  final AppButtonSize size;

  @override
  Widget build(BuildContext context) {
    final child = _buildChild();

    Widget button;

    final effectiveOnPressed = loading ? null : onPressed;

    switch (variant) {
      case AppButtonVariant.primary:
        button = FilledButton(
          onPressed: effectiveOnPressed,
          style: _buttonStyle(context),
          child: child,
        );
        break;

      case AppButtonVariant.secondary:
        button = FilledButton.tonal(
          onPressed: effectiveOnPressed,
          style: _buttonStyle(context),
          child: child,
        );
        break;

      case AppButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: effectiveOnPressed,
          style: _buttonStyle(context),
          child: child,
        );
        break;

      case AppButtonVariant.text:
        button = TextButton(
          onPressed: effectiveOnPressed,
          style: _buttonStyle(context),
          child: child,
        );
        break;

      case AppButtonVariant.danger:
        button = FilledButton(
          onPressed: effectiveOnPressed,
          style: _dangerStyle(context),
          child: child,
        );
        break;
    }

    if (tooltip != null) {
      button = Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    if (expanded) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }

  Widget _buildChild() {
    if (loading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    if (label.isEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading!,
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(label),
        if (trailing != null) ...[
          const SizedBox(width: AppSpacing.sm),
          trailing!,
        ],
      ],
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(_minimumSize()),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }

  ButtonStyle _dangerStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(_minimumSize()),
      backgroundColor: WidgetStatePropertyAll(
        colorScheme.error,
      ),
      foregroundColor: WidgetStatePropertyAll(
        colorScheme.onError,
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }

  Size _minimumSize() {
    switch (size) {
      case AppButtonSize.small:
        return const Size(64, 36);

      case AppButtonSize.medium:
        return const Size(64, 48);

      case AppButtonSize.large:
        return const Size(64, 56);
    }
  }
}