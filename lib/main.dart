import 'package:flutter/material.dart';
import 'package:bwball_shop/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:bwball_shop/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'BWBall Shop',
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
        home: const LoginPage(),
      ),
    );
  }
}
