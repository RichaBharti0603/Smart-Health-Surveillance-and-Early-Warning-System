import 'package:flutter/material.dart';

class WaterQualityScreen extends StatelessWidget {
  const WaterQualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Water Quality"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            title: Text("Village A"),
            subtitle: Text("pH: 7.2 | Safe"),
          ),
          ListTile(
            title: Text("Village B"),
            subtitle: Text("pH: 5.8 | Risk of contamination"),
          ),
        ],
      ),
    );
  }
}
