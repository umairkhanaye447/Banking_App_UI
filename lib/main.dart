import 'package:banking_app/View/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Banking App',
        theme: ThemeData(textTheme: GoogleFonts.jostTextTheme()),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
