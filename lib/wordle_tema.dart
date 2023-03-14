import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class WordleTema {
  static TextTheme temaTextoClaro = TextTheme(
    bodyLarge: GoogleFonts.notoSerifGeorgian(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey[850]
    ),
    displayLarge: GoogleFonts.notoSerifGeorgian(
      fontSize: 64.0,
      fontWeight: FontWeight.w900,
      color: Colors.grey[850],
    ),
    displayMedium: GoogleFonts.notoSerifGeorgian(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[850],
    ),
    displaySmall: GoogleFonts.notoSerifGeorgian(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[850],
    ),
    titleLarge: GoogleFonts.notoSerifGeorgian(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[850],
    ),
  );
  static TextTheme temaTextoOscuro = TextTheme(
    bodyLarge: GoogleFonts.notoSerifGeorgian(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.notoSerifGeorgian(
      fontSize: 48.0,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.notoSerifGeorgian(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.notoSerifGeorgian(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.notoSerifGeorgian(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
  static ThemeData claro() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColorDark: Colors.grey[850],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey[850],
        selectedItemColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.grey[850],
          splashColor: Colors.purple[200]
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: temaTextoClaro,
    );
  }
  static ThemeData oscuro() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColorDark: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.grey[850],
        unselectedItemColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        splashColor: Colors.purple[200]
      ),
      iconTheme: IconThemeData(
          color: Colors.grey[850]
      ),
      scaffoldBackgroundColor: Colors.grey[850],
      textTheme: temaTextoOscuro,
    );
  }
}