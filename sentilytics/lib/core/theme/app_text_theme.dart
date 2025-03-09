import 'package:flutter/material.dart';
import 'package:sentilytics/core/constants/app_size.dart';

class AppTextTheme {
  AppTextTheme._();
  // light text theme
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: AppSize.titleLargeText,
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: AppSize.titleMediumText,
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: AppSize.titleSmallText,
      color: Color(0xFF1E1E1E),
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: AppSize.bodyLargeText,
      color: Color(0xFF1E1E1E),
    ),
    bodyMedium: TextStyle(
      fontSize: AppSize.bodyMediumText,
      color: Color(0xFF1E1E1E),
    ),
    bodySmall: TextStyle(
      fontSize: AppSize.bodySmallText,
      color: Color(0xFF1E1E1E),
    ),
  );
  // dark text theme

  static TextTheme darkTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: AppSize.titleLargeText,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: AppSize.titleMediumText,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: AppSize.bodySmallText,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(fontSize: AppSize.bodyLargeText, color: Colors.white),
    bodyMedium: TextStyle(
      fontSize: AppSize.bodyMediumText,
      color: Colors.white,
    ),
    bodySmall: TextStyle(fontSize: AppSize.bodySmallText, color: Colors.white),
  );
}
