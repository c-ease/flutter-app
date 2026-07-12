import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_spacing.dart';

class AppGap extends StatelessWidget {
  const AppGap({
    super.key,
    this.width = 0,
    this.height = 0,
  });

  final double width;
  final double height;

  const AppGap.xs({super.key})
      : width = 0,
        height = AppSpacing.xs;

  const AppGap.sm({super.key})
      : width = 0,
        height = AppSpacing.sm;

  const AppGap.md({super.key})
      : width = 0,
        height = AppSpacing.md;

  const AppGap.lg({super.key})
      : width = 0,
        height = AppSpacing.lg;

  const AppGap.xl({super.key})
      : width = 0,
        height = AppSpacing.xl;

  const AppGap.xxl({super.key})
      : width = 0,
        height = AppSpacing.xxl;

  const AppGap.horizontalXs({super.key})
      : width = AppSpacing.xs,
        height = 0;

  const AppGap.horizontalSm({super.key})
      : width = AppSpacing.sm,
        height = 0;

  const AppGap.horizontalMd({super.key})
      : width = AppSpacing.md,
        height = 0;

  const AppGap.horizontalLg({super.key})
      : width = AppSpacing.lg,
        height = 0;

  const AppGap.horizontalXl({super.key})
      : width = AppSpacing.xl,
        height = 0;

  const AppGap.horizontalXxl({super.key})
      : width = AppSpacing.xxl,
        height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}