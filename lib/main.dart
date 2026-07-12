import 'package:flutter/material.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
import 'package:quote/core/theme/theme_controller.dart';
import 'package:quote/features/dashboard/presentation/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppLogger.info(
    'Application started.',
    tag: AppLogTag.ui,
  );

  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        return MaterialApp(
          title: 'Quote',
          debugShowCheckedModeBanner: false,
          theme: ThemeController.instance.theme,
          themeMode: ThemeController.instance.themeMode,
          home: const DashboardScreen(),
        );
      },
    );
  }
}