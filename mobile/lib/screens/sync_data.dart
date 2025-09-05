// lib/screens/sync_data.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SyncDataScreen extends StatefulWidget {
  const SyncDataScreen({super.key});

  @override
  State<SyncDataScreen> createState() => _SyncDataScreenState();
}

class _SyncDataScreenState extends State<SyncDataScreen> {
  bool _syncing = false;
  String _message = "Press button to sync data";

  Future<void> syncData() async {
    setState(() {
      _syncing = true;
      _message = "Syncing with server...";
    });

    final response = await http.post(
      Uri.parse("https://your-api-url.com/api/sync"),
      headers: {"Content-Type": "application/json"},
      body: "{}",
    );

    setState(() => _syncing = false);

    if (response.statusCode == 200) {
      setState(() => _message = "✅ Data synced successfully");
    } else {
      setState(() => _message = "❌ Sync failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sync Data")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            _syncing
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: syncData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text("Sync Now"),
                  ),
          ],
        ),
      ),
    );
  }
}
