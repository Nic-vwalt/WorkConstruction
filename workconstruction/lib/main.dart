import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workconstruction/screens/welcome/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Construction',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.yellow,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: login(),
    );
  }
}

