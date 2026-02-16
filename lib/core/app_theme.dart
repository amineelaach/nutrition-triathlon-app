import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    const primaryColor = Color(0xFF2E7D32);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      appBarTheme: const AppBarTheme(centerTitle: true),
      scaffoldBackgroundColor: const Color(0xFFF7F8F4),
      cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
