import 'package:flutter/material.dart';
import 'cases_screen.dart';
import 'alerts_screen.dart';
import 'water_quality_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'doctor_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Smart Health Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
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
            screen: const CasesScreen(),
          ),
          _buildTile(
            context,
            title: "🚨 Alerts",
            color: Colors.red,
            screen: const AlertsScreen(),
          ),
          _buildTile(
            context,
            title: "💧 Water Quality",
            color: Colors.blue,
            screen: const WaterQualityScreen(),
          ),
          _buildTile(
            context,
            title: "👨‍⚕️ Doctors",
            color: Colors.green,
            screen: const DoctorListScreen(),
          ),
          _buildTile(
            context,
            title: "💬 Chat",
            color: Colors.purple,
            screen: const ChatScreen(),
          ),
          _buildTile(
            context,
            title: "👤 Profile",
            color: Colors.teal,
            screen: const ProfileScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required String title,
      required Color color,
      required Widget screen}) {
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
            colors: [color.withOpacity(0.9), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    color: Colors.black26,
                    offset: Offset(1, 1),
                    blurRadius: 3),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
