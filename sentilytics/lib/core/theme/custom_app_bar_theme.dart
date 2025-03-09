import 'package:flutter/material.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  // Light App Bar Theme
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    actionsIconTheme: IconThemeData(color: Color(0xFF1E1E1E)),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    color: Color(0xFF1E1E1E),
    elevation: 0,
    surfaceTintColor: Colors.transparent,
  );

  // Dark App Bar Theme
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    color: Colors.white,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
  );
}
