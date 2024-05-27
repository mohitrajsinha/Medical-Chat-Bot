import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medbot/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: kPrimaryLightColor,
      buttonTheme: ButtonThemeData(
        buttonColor: darkBluishcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: const TextStyle(color: Colors.black)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
          .copyWith(secondary: darkBluishcolor),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
        elevation: 0.0,
      ));

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.dark,
      brightness: Brightness.light,
      // colorScheme: ColorScheme.light(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: kPrimaryColor,
      buttonTheme: ButtonThemeData(
        buttonColor: lightBluishColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20)),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.black,
        elevation: 0.0,
      ));

  //Colors
  static Color creamcolor = const Color(0xFFFFF3E0);
  static Color blue = Vx.gray900;
  static Color darkBluishcolor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.blue500;
}
