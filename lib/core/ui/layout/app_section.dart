import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_spacing.dart';
import 'package:quote/core/ui/layout/app_gap.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: textTheme.titleLarge,
            ),
            const AppGap.sm(),
          ],
          child,
        ],
      ),
    );
  }
}