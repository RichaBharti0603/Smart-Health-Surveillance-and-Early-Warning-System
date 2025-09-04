import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  final List<String> alerts = const [
    "⚠️ Cholera outbreak reported nearby",
    "⚠️ Water contamination detected in Village A",
    "✅ Safe water supply restored in Block B",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Outbreak Alerts"), backgroundColor: Colors.teal),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (_, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(alerts[index]),
          ),
        ),
      ),
    );
  }
}
