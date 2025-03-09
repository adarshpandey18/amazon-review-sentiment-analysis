import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  // Light Elevated Button Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: Color(0xFF1E1E1E),
          backgroundColor: Colors.white,
          iconColor: Color(0xFF1E1E1E),
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          disabledIconColor: Color(0xFF1E1E1E),
          enableFeedback: true,
          iconAlignment: IconAlignment.start,
          padding: EdgeInsets.symmetric(horizontal: 19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      );

  // Dark Elevated Button Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
          iconColor: Colors.white,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          disabledIconColor: Colors.white,
          enableFeedback: true,
          iconAlignment: IconAlignment.start,
          padding: EdgeInsets.symmetric(horizontal: 19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      );
}
