import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const ink = Color(0xFF111111);
  static const paper = Color(0xFFFAFAF8);
  static const muted = Color(0xFF777773);

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: paper,
    colorScheme: const ColorScheme.light(
      primary: ink,
      surface: paper,
      onSurface: ink,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 58,
        height: 0.95,
        fontWeight: FontWeight.w600,
        letterSpacing: -2.6,
      ),
      headlineLarge: TextStyle(
        fontSize: 38,
        height: 1.05,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.4,
      ),
      titleLarge: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
      ),
      bodyLarge: TextStyle(fontSize: 17, height: 1.55),
      bodyMedium: TextStyle(fontSize: 14, height: 1.45),
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.7,
      ),
    ),
    dividerColor: const Color(0x1A000000),
  );
}
