import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF4535C9);
  static const dark = Color(0xFF1B1464);
  static const blob = Color(0xFFEDECFB);
  static const border = Color(0xFFE3E3F0);
  static const grey = Color(0xFF6B6B80);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}