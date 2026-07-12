import 'package:flutter/material.dart';
import 'package:quote/core/tokens/app_spacing.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    this.title,
    this.leading,
    this.actions,
    required this.child,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
              leading: leading,
              actions: actions,
            ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: child,
        ),
      ),
    );
  }
}