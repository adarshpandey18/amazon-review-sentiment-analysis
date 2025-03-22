import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentilytics/core/theme/app_action_icon_theme.dart';
import 'package:sentilytics/core/theme/app_elevated_button_theme.dart';
import 'package:sentilytics/core/theme/app_input_decoration_theme.dart';
import 'package:sentilytics/core/theme/app_text_theme.dart';
import 'package:sentilytics/core/theme/custom_app_bar_theme.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightAppTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF1E1E1E),
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.grey,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1E1E1E),
      secondary: Colors.grey,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Color(0xFF1E1E1E),
      onSurface: Color(0xFF1E1E1E),
    ),

    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    actionIconTheme: AppActionIconTheme.lightActionIconTheme,
    textTheme: AppTextTheme.lightTextTheme,
  );

  // Dark Theme
  static ThemeData darkAppTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF1E1E1E),
    dividerColor: Colors.grey,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey,
      surface: Color(0xFF1E1E1E),
      onPrimary: Color(0xFF1E1E1E),
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme,
    actionIconTheme: AppActionIconTheme.darkActionIconTheme,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
