import 'package:flutter/material.dart';
import 'package:quote/core/theme/app_theme.dart';
import 'package:quote/core/theme/app_theme_palette.dart';

class ThemeController extends ChangeNotifier {
  ThemeController._();

  static final ThemeController instance = ThemeController._();

  ThemeMode _themeMode = ThemeMode.light;
  AppThemePalette _palette = AppThemePalettes.light;

  ThemeMode get themeMode => _themeMode;

  AppThemePalette get palette => _palette;

  ThemeData get theme => AppTheme.fromPalette(_palette);

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      _palette = AppThemePalettes.dark;
    } else {
      _themeMode = ThemeMode.light;
      _palette = AppThemePalettes.light;
    }

    notifyListeners();
  }

  void updatePalette(AppThemePalette palette) {
    _palette = palette;
    notifyListeners();
  }
}