import 'package:doro/pages/failecard.dart';
import 'package:doro/pages/successpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doro/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        // useMaterial3: true, // This property might not be needed, so it's commented out
        fontFamily: GoogleFonts.raleway().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
