import 'package:flutter/material.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  // Light App Bar Theme
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Color(0xFF1E1E1E)),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    surfaceTintColor: Colors.transparent,

    iconTheme: IconThemeData(color: Color(0xFF1E1E1E)),
  );

  // Dark App Bar Theme
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    surfaceTintColor: Colors.transparent,

    iconTheme: IconThemeData(color: Colors.white),
  );
}
