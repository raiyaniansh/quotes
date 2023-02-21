import 'package:flutter/material.dart';
import 'package:quotes/create.dart';
import 'package:quotes/data.dart';
import 'package:quotes/fav.dart';
import 'package:quotes/home.dart';
import 'package:quotes/newadd.dart';
import 'package:quotes/splesh.dart';
import 'package:quotes/theme.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Splesh(),
        'home':(context) => Home(),
        'data':(context) =>Data(),
        'add':(context) =>Add(),
        'fav':(context) => Fav(),
        'fav':(context) => Fav(),
        'cre':(context) => Create(),
      },
    )
  );
}