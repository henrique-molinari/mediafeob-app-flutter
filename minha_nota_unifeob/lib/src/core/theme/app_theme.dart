import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color unifeobYellow = Color(0xFFFFD700); // Ajuste para o tom exato
  static const Color unifeobRed = Color(0xFFD32F2F);
  static const Color backgroundGrey = Color(0xFFF5F500);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: unifeobYellow,
        primary: unifeobYellow,
        error: unifeobRed,
        surface: Colors.white,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: unifeobYellow,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}