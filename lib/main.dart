import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuess/app/services/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess n',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.itimTextTheme(),
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}
