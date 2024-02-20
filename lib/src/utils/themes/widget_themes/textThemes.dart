import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';

class MyTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    // *--- Headline ---*
    headlineSmall: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: darkColor500),
    headlineMedium: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: darkColor500),
    headlineLarge: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: darkColor500),
    // *--- Title ---*
    titleSmall: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: darkColor500),
    titleMedium: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: darkColor500),
    titleLarge: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: darkColor500),
    // *--- Body ---*
    bodySmall: GoogleFonts.anonymousPro(
        color: darkColor500),
    bodyMedium: GoogleFonts.anonymousPro(
        color: darkColor500),
    bodyLarge: GoogleFonts.anonymousPro(
        color: darkColor500),
  );

  static TextTheme darkTextTheme = TextTheme(
    // *--- Headline ---*
    headlineSmall: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: lightColor700),
    headlineMedium: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: lightColor700),
    headlineLarge: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: lightColor700),
    // *--- Title ---*
    titleSmall: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: lightColor700),
    titleMedium: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: lightColor700),
    titleLarge: GoogleFonts.anonymousPro(
        fontWeight: FontWeight.bold,
        color: lightColor700),
    // *--- Body ---*
    bodySmall: GoogleFonts.anonymousPro(
        color: lightColor700),
    bodyMedium: GoogleFonts.anonymousPro(
        color: lightColor700),
    bodyLarge: GoogleFonts.anonymousPro(
        color: lightColor700),
  );
}
