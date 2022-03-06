import 'package:flutter/material.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/config/default_config.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  initializeConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Users(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Psychology_app',
          theme: ThemeData(
              primaryColor: primaryColorHsl37,
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                headline1: GoogleFonts.ptSans(
                    fontSize: 102,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5),
                headline2: GoogleFonts.ptSans(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.5),
                headline3: GoogleFonts.ptSans(
                    fontSize: 51, fontWeight: FontWeight.w400),
                headline4: GoogleFonts.ptSans(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25),
                headline5: GoogleFonts.ptSans(
                    fontSize: 25, fontWeight: FontWeight.w400),
                headline6: GoogleFonts.ptSans(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15),
                subtitle1: GoogleFonts.ptSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15),
                subtitle2: GoogleFonts.ptSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1),
                bodyText1: GoogleFonts.ptSansCaption(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
                bodyText2: GoogleFonts.ptSansCaption(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25),
                button: GoogleFonts.ptSansCaption(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.25),
                caption: GoogleFonts.ptSansCaption(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4),
                overline: GoogleFonts.ptSansCaption(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5),
              )),
          routes: AppRoutes.routes,
        ));
  }
}
