import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'data_upload.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASHA Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Patients List
            const Text("Patient Data Overview",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            PatientList(),

            const Divider(height: 32),

            // 🔹 Alerts
            const Text("Latest Alerts",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            AlertsList(),

            const Divider(height: 32),

            // 🔹 Chart
            const Text("Cases Over Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: CasesLineChart()),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DataUploadPage()),
                  );
                },
                child: const Text("➕ Add Patient Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Patient List Widget
class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("patients").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        var docs = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            var data = docs[index].data() as Map<String, dynamic>;
            return Card(
              child: ListTile(
                title: Text(data["name"] ?? "Unknown"),
                subtitle: Text("Age: ${data["age"]}, Status: ${data["status"]}"),
              ),
            );
          },
        );
      },
    );
  }
}

/// 🔹 Alerts Widget
class AlertsList extends StatelessWidget {
  const AlertsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("alerts").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        var docs = snapshot.data!.docs;
        return Column(
          children: docs
              .map((d) => ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: Text(d["message"] ?? "No message"),
                  ))
              .toList(),
        );
      },
    );
  }
}

/// 🔹 Line Chart Widget
class CasesLineChart extends StatelessWidget {
  const CasesLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 5),
            ],
            isCurved: true,
            color: Colors.teal,
            barWidth: 3,
          )
        ],
      ),
    );
  }
}
