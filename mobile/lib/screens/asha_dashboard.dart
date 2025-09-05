// lib/screens/asha_dashboard.dart

import 'package:flutter/material.dart';
import 'report_case.dart';
import 'alerts_screen.dart';

class AshaDashboardPage extends StatelessWidget {
  const AshaDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASHA Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildTile(
            context,
            title: "📋 Report Case",
            color: Colors.orange,
            screen: const ReportCaseScreen(),
          ),
          _buildTile(
            context,
            title: "🚨 Community Alerts",
            color: Colors.red,
            screen: const AlertsScreen(),
          ),
          _buildTile(
            context,
            title: "🔄 Sync Data",
            color: Colors.green,
            screen: const SyncDataScreen(), // We'll create this next
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required String title, required Color color, required Widget screen}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// Temporary placeholder for Sync Data screen
class SyncDataScreen extends StatelessWidget {
  const SyncDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sync Data")),
      body: const Center(
        child: Text("Syncing with server..."),
      ),
    );
  }
}
