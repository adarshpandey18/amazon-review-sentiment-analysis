import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();
  // light input decoration theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: BorderSide(color: Colors.grey),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 19),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF1E1E1E)),
    ),
    prefixIconColor: Color(0xFF1E1E1E),
    alignLabelWithHint: true,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
    ),
    fillColor: Colors.transparent,
    iconColor: Color(0xFF1E1E1E),
    errorStyle: TextStyle(color: Colors.redAccent),
    focusColor: Colors.grey.shade300,
    hintStyle: TextStyle(color: Colors.grey),
  );

  // dark input decoration theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: BorderSide(color: Colors.grey),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 19),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    prefixIconColor: Colors.white,
    alignLabelWithHint: true,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
    ),
    fillColor: Colors.transparent,
    iconColor: Colors.white,
    errorStyle: TextStyle(color: Colors.redAccent),
    focusColor: Colors.grey.shade100,
    hintStyle: TextStyle(color: Colors.grey),
  );
}
