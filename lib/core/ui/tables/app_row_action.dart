import 'package:flutter/material.dart';

class AppRowAction {
  const AppRowAction({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
}