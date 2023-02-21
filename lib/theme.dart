import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
ThemeData theme = ThemeData(
  backgroundColor: Color(0xff1B1C1E),
  appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff1B1C1E), centerTitle: true, elevation: 0),
  textTheme: TextTheme(
      headline1: GoogleFonts.dancingScript(
        textStyle: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
      ),
      headline2: TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
);

Widget Mbox(String a)
{
  return Container(
    width: 115,
    height: 115,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(
            'assets/images/$a'),
      ),
    ),
  );
}

Widget Mbox2(String b,String c)
{
  return Container(
    height: 55,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
          image:
          AssetImage('assets/images/$b'),
          fit: BoxFit.cover),
    ),
    alignment: Alignment.centerLeft,
    child: Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.50),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text("$c",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}