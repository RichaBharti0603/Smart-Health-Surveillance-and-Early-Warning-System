import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Health Alerts"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Cholera risk in Village A"),
              subtitle: Text("Detected by water sensor - 2 Sept"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Typhoid cases rising"),
              subtitle: Text("5 new reports in District X"),
            ),
          ),
        ],
      ),
    );
  }
}
