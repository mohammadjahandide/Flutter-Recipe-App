import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 27, 216, 34),
      elevation: 0,
      // titleTextStyle: Theme.of(context).textTheme.bodyText1,
    ),
    primaryColor: const Color.fromARGB(255, 27, 216, 34),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.greenAccent,
    ),
    // textTheme: GoogleFonts.ralewayTextTheme(),
    // textTheme: GoogleFonts.dancingScriptTextTheme(),
    // textTheme: GoogleFonts.lobsterTextTheme(),
    textTheme: GoogleFonts.courgetteTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 27, 216, 34),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.greenAccent,
      selectionColor: Colors.greenAccent,
    ),
  );
}
