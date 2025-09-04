import 'package:flutter/material.dart';

class WaterQualityScreen extends StatelessWidget {
  const WaterQualityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Quality"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "💧 Water Quality Monitoring",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.water, color: Colors.blue),
              title: const Text("pH Level"),
              subtitle: const Text("Normal: 6.5 - 8.5"),
              trailing: const Text("7.2 ✅"),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.science, color: Colors.green),
              title: const Text("Turbidity"),
              subtitle: const Text("Normal: < 5 NTU"),
              trailing: const Text("3 NTU ✅"),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bug_report, color: Colors.red),
              title: const Text("Bacterial Presence"),
              subtitle: const Text("Safe: None detected"),
              trailing: const Text("None ✅"),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Water quality data refreshed ✅"),
                ),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh Data"),
          )
        ],
      ),
    );
  }
}
