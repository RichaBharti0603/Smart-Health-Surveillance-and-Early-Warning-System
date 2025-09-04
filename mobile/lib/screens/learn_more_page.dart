import 'package:flutter/material.dart';

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn More")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "About the Project",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const SizedBox(height: 15),
            const Text(
              "This Smart Health Surveillance and Early Warning System helps detect, "
              "monitor, and prevent outbreaks of water-borne diseases in vulnerable communities.\n\n"
              "Key Features:",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 10),
            _buildBullet("Collects data from local clinics, ASHA workers, and volunteers."),
            _buildBullet("AI/ML models to predict potential outbreaks."),
            _buildBullet("Integrates with IoT water sensors for contamination tracking."),
            _buildBullet("Sends real-time alerts to health officials & communities."),
            _buildBullet("Offers multilingual education and awareness campaigns."),
            const SizedBox(height: 20),
            const Text(
              "Together, we aim for a safer, healthier, and stronger India 🇮🇳.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(fontSize: 20, color: Colors.teal)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
