import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/user.png"),
            ),
            const SizedBox(height: 20),
            const Text("John Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("johndoe@example.com"),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("My Reports"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
