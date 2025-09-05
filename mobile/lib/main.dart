import 'package:flutter/material.dart';
import 'screens/landing_page.dart';
import 'screens/asha_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Health Surveillance',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // Landing page for general users
      home: const LandingPage(),
      routes: {
        '/asha-login': (context) => const AshaLoginPage(),
      },
    );
  }
}
