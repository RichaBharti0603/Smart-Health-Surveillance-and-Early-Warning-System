import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const SmartHealthApp());
}

class SmartHealthApp extends StatelessWidget {
  const SmartHealthApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Health",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}
