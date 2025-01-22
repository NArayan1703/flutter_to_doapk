// lib/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeMode _themeMode;
  late SharedPreferences _prefs;

  ThemeProvider() {
    _themeMode = ThemeMode.system;
    _initializePreferences();
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final String? themeName = _prefs.getString('theme');
    if (themeName != null) {
      _themeMode = ThemeMode.values.firstWhere(
            (element) => element.toString() == themeName,
        orElse: () => ThemeMode.system,
      );
      notifyListeners();
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _prefs.setString('theme', mode.toString());
    notifyListeners();
  }

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  // Toggle between light and dark mode
  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      await setThemeMode(ThemeMode.dark);
    } else if (_themeMode == ThemeMode.dark) {
      await setThemeMode(ThemeMode.light);
    } else {
      // If system, default to light
      await setThemeMode(ThemeMode.light);
    }
  }
}