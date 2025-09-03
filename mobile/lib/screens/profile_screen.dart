 
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Name: Richa", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Role: Community Worker", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Region: Northeast India", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
