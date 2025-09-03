 import 'package:flutter/material.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Doctors"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.medical_services),
              title: Text("Dr. Sharma"),
              subtitle: Text("Specialist: Water-borne diseases"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.medical_services),
              title: Text("Dr. Das"),
              subtitle: Text("General Physician"),
            ),
          ),
        ],
      ),
    );
  }
}
