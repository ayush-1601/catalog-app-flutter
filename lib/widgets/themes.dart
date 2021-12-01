import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hexcolor/hexcolor.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: CreamColour,
      // ignore: deprecated_member_use
      accentColor: DarkBluishColour,
      // ignore: deprecated_member_use
      buttonColor: DarkBluishColour,
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),

        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColour,
      // ignore: deprecated_member_use
      accentColor: Colors.white,
      // ignore: deprecated_member_use
      buttonColor: lightBluishColour,
      //primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),

        // ignore: deprecated_member_use
        textTheme: Theme.of(context).textTheme,
      ));

  //colors

  static Color CreamColour = Color(0xfff7f7f5);
  static Color darkCreamColour = Vx.gray900;
  static Color DarkBluishColour = Color(0xff403b58);
  static Color lightBluishColour = Vx.indigo500;
}
