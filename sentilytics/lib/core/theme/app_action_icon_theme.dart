import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppActionIconTheme {
  AppActionIconTheme._();

  // light action icon theme
  static ActionIconThemeData lightActionIconTheme = ActionIconThemeData(
    backButtonIconBuilder:
        (context) => const Icon(CupertinoIcons.back, color: Color(0xFF1E1E1E)),
  );

  // dark action icon theme
  static ActionIconThemeData darkActionIconTheme = ActionIconThemeData(
    backButtonIconBuilder:
        (context) => const Icon(CupertinoIcons.back, color: Colors.grey),
  );
}
