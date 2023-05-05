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
      fontSize: 70.0,
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
      fontSize: 70.0,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.notoSerifGeorgian(
      fontSize: 24.0,
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
  static TextTheme temaTextoOscuroOpciones = TextTheme(
    bodySmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white60
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white
    )
  );
  static TextTheme temaTextoClaroOpciones = TextTheme(
      bodySmall: GoogleFonts.openSans(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.white60
      ),
      displaySmall: GoogleFonts.openSans(
          fontSize: 21.0,
          fontWeight: FontWeight.w700,
          color: Colors.white
      )
  );
  static ThemeData claro() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      primaryColorDark: Colors.grey[850],
      backgroundColor: Colors.grey[400],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 21.0,
        )
      ),
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
      primaryTextTheme: temaTextoClaroOpciones
    );
  }
  static ThemeData oscuro() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[850],
      brightness: Brightness.dark,
      primaryColor: Colors.grey[850],
      primaryColorDark: Colors.white,
      backgroundColor: Colors.grey.shade800,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850],
        titleTextStyle: TextStyle(
          color: Colors.grey[850],
          fontSize: 21.0
        )
      ),
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
      textTheme: temaTextoOscuro,
      primaryTextTheme: temaTextoOscuroOpciones
    );
  }
}