import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_radius.dart';
import 'package:quote/core/tokens/app_spacing.dart';
import 'package:quote/core/ui/cards/app_card_variant.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.variant = AppCardVariant.filled,
  });

  final Widget child;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final VoidCallback? onTap;

  final AppCardVariant variant;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      child: child,
    );

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: content,
      );
    }

    switch (variant) {
      case AppCardVariant.filled:
        return Card.filled(
          margin: margin,
          clipBehavior: onTap != null ? Clip.antiAlias : Clip.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: content,
        );

      case AppCardVariant.outlined:
        return Card.outlined(
          margin: margin,
          clipBehavior: onTap != null ? Clip.antiAlias : Clip.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: content,
        );
    }
  }
}