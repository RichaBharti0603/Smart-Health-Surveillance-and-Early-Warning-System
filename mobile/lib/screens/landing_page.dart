import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _controller = PageController();

  final List<Map<String, dynamic>> pages = [
    {
      "title": "Smart Health Surveillance",
      "subtitle": "Early detection of water-borne diseases in vulnerable communities.",
      "icon": Icons.health_and_safety,
      "color": Colors.teal,
    },
    {
      "title": "Community + AI",
      "subtitle": "Data from clinics, ASHA workers & volunteers, powered by AI outbreak prediction.",
      "icon": Icons.groups,
      "color": Colors.deepOrange,
    },
    {
      "title": "Safe Water, Healthy Lives",
      "subtitle": "Integration with low-cost water quality sensors & IoT for safe drinking water.",
      "icon": Icons.water_drop,
      "color": Colors.blue,
    },
    {
      "title": "Real-Time Alerts",
      "subtitle": "Health officials & communities get instant alerts to prevent outbreaks.",
      "icon": Icons.notifications_active,
      "color": Colors.redAccent,
    },
    {
      "title": "Awareness & Education",
      "subtitle": "Multilingual interface with hygiene awareness & offline support.",
      "icon": Icons.school,
      "color": Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF9933), Colors.white, Color(0xFF138808)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                " सुरक्षित जल,स्वस्थ भारत",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Smart Health Surveillance & Early Warning System",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // PageView (storytelling carousel)
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: pages[index]["color"].withOpacity(0.15),
                          child: Icon(
                            pages[index]["icon"],
                            size: 70,
                            color: pages[index]["color"],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          pages[index]["title"],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            pages[index]["subtitle"],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Page Indicator
              SmoothPageIndicator(
                controller: _controller,
                count: pages.length,
                effect: WormEffect(
                  dotColor: Colors.grey.shade300,
                  activeDotColor: Colors.deepOrange,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(height: 25),

              // CTA Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to signup
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6,
                      ),
                      child: const Text(
                        "Join the Movement",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton(
                      onPressed: () {
                        // Navigate to learn more
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        side: const BorderSide(color: Colors.teal, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Learn More",
                        style: TextStyle(fontSize: 16, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
