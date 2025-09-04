 import 'package:flutter/material.dart';
import 'appointment_screen.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  final List<Map<String, String>> doctors = const [
    {"name": "Dr. Sharma", "specialty": "General Physician"},
    {"name": "Dr. Singh", "specialty": "Pediatrician"},
    {"name": "Dr. Gupta", "specialty": "Water-borne Diseases"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctors"), backgroundColor: Colors.teal),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (_, index) {
          final doc = doctors[index];
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(doc["name"]!),
            subtitle: Text(doc["specialty"]!),
            trailing: ElevatedButton(
              child: const Text("Book"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AppointmentScreen(doctorName: doc["name"]!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
