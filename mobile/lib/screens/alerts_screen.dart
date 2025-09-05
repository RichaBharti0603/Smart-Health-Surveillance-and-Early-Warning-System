// lib/screens/alerts_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  List alerts = [];
  bool _loading = true;

  Future<void> fetchAlerts() async {
    final response = await http.get(
      Uri.parse("https://your-api-url.com/api/alerts"),
    );

    if (response.statusCode == 200) {
      setState(() {
        alerts = jsonDecode(response.body);
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Failed to fetch alerts")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlerts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Community Alerts")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                final alert = alerts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: Text(alert["title"] ?? "Alert"),
                    subtitle: Text(alert["description"] ?? "No details"),
                  ),
                );
              },
            ),
    );
  }
}
