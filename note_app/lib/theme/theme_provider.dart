import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier { // ChangeNotifier class
  // Define light and dark theme modes
  static final ThemeData lightMode = ThemeData.light();
  static final ThemeData darkMode = ThemeData.dark();

  // Initialize theme mode to light mode
  ThemeData _themeMode = lightMode;
  
  
  // Getter to get the current theme mode
  ThemeData get themeMode => _themeMode;


  // Getter to check if the current theme mode is dark mode
  bool get isDarkMode => _themeMode == darkMode;


// Setter to set the theme mode
  set themeMode(ThemeData theme) {
    _themeMode = themeMode;
    notifyListeners();
  }

  // Method to toggle theme mode
  void toggleTheme(bool value) {
    if (_themeMode == lightMode) {
      _themeMode = darkMode;
    } else {
      _themeMode = lightMode;
    }
    notifyListeners();
  }
}