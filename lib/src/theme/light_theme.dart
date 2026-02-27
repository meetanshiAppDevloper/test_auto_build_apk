import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';

class LightTheme {
  static ThemeData getThemeData(Color primaryColor, Color secondaryColor) {
    return ThemeData(
      fontFamily: 'Rubik',
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: secondaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: secondaryColor,
        primary: secondaryColor,
        secondary: primaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
        titleLarge: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: AppColors.buttonText,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
