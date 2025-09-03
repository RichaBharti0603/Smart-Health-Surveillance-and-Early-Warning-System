import 'package:flutter/material.dart';
import 'cases_screen.dart';
import 'alerts_screen.dart';
import 'water_quality_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'doctor_list_screen.dart';
import 'appointment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Health - Home"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CasesScreen()),
              );
            },
            child: const Text("📋 Report a Health Case"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AlertsScreen()),
              );
            },
            child: const Text("🚨 View Alerts"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WaterQualityScreen()),
              );
            },
            child: const Text("💧 Water Quality"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
            child: const Text("💬 Community Chat"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DoctorListScreen()),
              );
            },
            child: const Text("👨‍⚕️ Find Doctors"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppointmentScreen()),
              );
            },
            child: const Text("📅 Book Appointment"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const Text("👤 My Profile"),
          ),
        ],
      ),
    );
  }
}
