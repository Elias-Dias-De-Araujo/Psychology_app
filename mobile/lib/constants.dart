import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary600 = Color.fromRGBO(66, 225, 219, 1);
const primary500 = Color.fromRGBO(33, 207, 201, 1);
const primary400 = Color.fromRGBO(26, 165, 160, 1);
const primary300 = Color.fromRGBO(19, 119, 115, 1);
const primary200 = Color.fromRGBO(12, 75, 73, 1);
const primary100 = Color.fromRGBO(230, 255, 243, 1);

const secondary600 = Color.fromRGBO(247, 74, 141, 1);
const secondary500 = Color.fromRGBO(245, 25, 111, 1);
const secondary400 = Color.fromRGBO(212, 9, 88, 1);
const secondary300 = Color.fromRGBO(161, 7, 67, 1);
const secondary200 = Color.fromRGBO(113, 5, 47, 1);
const secondary100 = Color.fromRGBO(255, 230, 233, 1);

final ThemeData appTheme = ThemeData(
    primaryColor: primary400,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: GoogleFonts.ptSans(fontSize: 102, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.ptSans(fontSize: 64, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.ptSans(fontSize: 51, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.ptSans(fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.ptSans(fontSize: 25, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.ptSans(fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.ptSans(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.ptSans(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.ptSansCaption(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.ptSansCaption(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.ptSansCaption(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.ptSansCaption(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.ptSansCaption(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ));
