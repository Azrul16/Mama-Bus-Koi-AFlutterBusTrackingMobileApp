import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const primary = Color(0xFF087A5B);
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      surface: const Color(0xFFF7F9F5),
    ),
    scaffoldBackgroundColor: const Color(0xFFF7F9F5),
    cardTheme: const CardThemeData(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        side: BorderSide(color: Color(0xFFE4E9E5)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFFE4E9E5)),
      ),
    ),
  );
}
