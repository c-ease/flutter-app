import 'package:flutter/material.dart';
import 'package:quote/core/logging/app_log_tag.dart';
import 'package:quote/core/logging/app_logger.dart';
import 'package:quote/core/ui/layout/app_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    AppLogger.info(
      'Dashboard opened.',
      tag: AppLogTag.ui,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppPage(
        child: Center(
          child: Text('Dashboard'),
        ),
      ),
    );
  }
}