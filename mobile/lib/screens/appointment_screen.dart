import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  final String? doctorName;

  const AppointmentScreen({super.key, this.doctorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          doctorName != null
              ? "Appointment with $doctorName"
              : "Book Appointment",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (doctorName != null)
              Text(
                "Schedule an appointment with $doctorName",
                style: const TextStyle(fontSize: 18),
              )
            else
              const Text(
                "No doctor selected. Please choose from the list.",
                style: TextStyle(fontSize: 18),
              ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: const InputDecoration(
                labelText: "Enter symptoms",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Appointment booked successfully!")),
                );
              },
              child: const Text("Confirm Appointment"),
            ),
          ],
        ),
      ),
    );
  }
}
