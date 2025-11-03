import 'package:flutter/material.dart';
import 'package:bwball_shop/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      colorScheme: ColorScheme.light(
          primary: const Color(0xFFF1DFB0), // warna utama cream
          secondary: const Color(0xFFEED9C4), // warna aksen
          surface: const Color(0xFFFFF8E1),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFAF0), // warna background halaman
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF1DFB0),
          foregroundColor: Colors.white,
        ),
      ),
      home: MyHomePage(),
    );
  }
}