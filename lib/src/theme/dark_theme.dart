import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';

class DarkTheme {
  static ThemeData getThemeData(Color primaryColor, Color secondaryColor) {
    return ThemeData(
      fontFamily: 'Rubik',
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: AppColors.darkAppBarBgColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.darkAppBarBgColor,
        foregroundColor: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.whiteColor),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.whiteColor),
        titleLarge:
            TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteColor),
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
        fillColor: AppColors.darkInputFill,
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
