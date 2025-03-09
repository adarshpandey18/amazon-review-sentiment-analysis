import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  // light text theme
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 26,
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 22,
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF1E1E1E)),
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E)),
    bodySmall: TextStyle(fontSize: 14, color: Color(0xFF1E1E1E)),
  );
  // dark text theme

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 26,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    bodySmall: TextStyle(fontSize: 14, color: Colors.white),
  );
}
