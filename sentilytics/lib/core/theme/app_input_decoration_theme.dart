import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  // Light Input Decoration Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),

    // Default border
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.grey),
    ),

    // Enabled border (default state)
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6), // Keep same radius
      borderSide: const BorderSide(color: Color(0xFF1E1E1E)),
    ),

    // Focused border (when field is clicked)
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Color(0xFF1E1E1E), width: 1.5),
    ),

    // Disabled border
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.grey),
    ),

    // Error border (when validation fails)
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),

    // Focused error border (when validation fails and focused)
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),

    // Icon colors
    prefixIconColor: const Color(0xFF1E1E1E),
    iconColor: const Color(0xFF1E1E1E),

    // Hint, error, and focus colors
    errorStyle: const TextStyle(color: Colors.redAccent),
    hintStyle: TextStyle(color: Colors.grey.shade600),
    focusColor: Colors.grey.shade300,
  );

  // Dark Input Decoration Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),

    // Default border
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.grey),
    ),

    // Enabled border
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.grey),
    ),

    // Focused border (when field is clicked)
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    ),

    // Disabled border
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.white),
    ),

    // Error border (when validation fails)
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6),
      borderSide: const BorderSide(color: Colors.redAccent),
    ),

    // Focused error border (when validation fails and focused)
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17.6), //
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),

    // Icon colors
    prefixIconColor: Colors.white,
    iconColor: Colors.white,

    // Hint, error, and focus colors
    errorStyle: const TextStyle(color: Colors.redAccent),
    hintStyle: TextStyle(color: Colors.white),
    focusColor: Colors.white,
  );
}
