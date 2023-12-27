import 'package:flutter/material.dart';
import 'package:mausam_app/Pages/home_page.dart';
import 'package:mausam_app/Pages/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const LoadingPage(),
        "/home_page": (context) => const HomePage(),
      },
    );
  }
}
