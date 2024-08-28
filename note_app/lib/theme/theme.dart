import "package:flutter/material.dart";

// light mode
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light( 
    surface: Colors.grey.shade200,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,

  ),
);

// dark mode

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark( 
    surface: const Color.fromARGB(255, 149, 149, 149),
    primary: const Color.fromARGB(255, 116, 115, 115),
    secondary: const Color.fromARGB(255, 28, 28, 28),
    inversePrimary: Colors.grey.shade300,

      ),
);