import 'package:flutter/material.dart';
import 'package:quote/core/ui/layout/app_section.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return AppSection(
      child: Row(
        children: [
          IconButton.filledTonal(
            onPressed: onToggleTheme,
            icon: Icon(
              isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            tooltip: isDarkMode
                ? 'Switch to light mode'
                : 'Switch to dark mode',
          ),
          const Spacer(),
          Text(
            'Quote',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}