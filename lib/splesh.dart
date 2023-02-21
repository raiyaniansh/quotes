import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Splesh extends StatefulWidget {
  const Splesh({Key? key}) : super(key: key);

  @override
  State<Splesh> createState() => _SpleshState();
}

class _SpleshState extends State<Splesh> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 500,),
              Image.asset('assets/images/logo.png',height: 100,width: 500),
              Text("Best Quotes",style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 40,color: Colors.white)
              ),),
              SizedBox(height: 5,),
              Text("You are amazing. remember that! ",style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,backgroundColor: Colors.white))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
