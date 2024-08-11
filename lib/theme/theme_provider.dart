import 'package:flutter/material.dart';
import 'package:project/theme/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  String currentTheme = 'Light Mode'; // Corrected naming convention

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(bool isDark) {
    _themeData = isDark ? darkMode : lightMode;
    currentTheme = isDark ? 'Dark Mode' : 'Light Mode';
    notifyListeners();
  }
}
