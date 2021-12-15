import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appMargin = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

final myTextTheme = TextTheme(
  headline1: GoogleFonts.lato(
      fontSize: 101, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.lato(
      fontSize: 63, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.lato(fontSize: 50, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.lato(
      fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.lato(
      fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lato(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lato(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lato(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lato(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
