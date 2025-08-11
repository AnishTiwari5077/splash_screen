import 'package:flutter/material.dart';
import 'package:animation/screens/splash.screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      debugShowCheckedModeBanner: false,
      home: Splashscreen(), // Directly load splash screen
    );
  }
}
