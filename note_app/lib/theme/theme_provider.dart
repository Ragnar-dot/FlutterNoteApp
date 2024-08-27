
import 'package:flutter/material.dart';
import "package:isarcrudtute/theme/theme.dart";


class ThemeProvider with ChangeNotifier {
// initialize - theme mode is light mode

ThemeData _themeMode = lightMode;

ThemeData get themeMode => _themeMode;

bool get isDarkMode => _themeMode == darkMode;


}