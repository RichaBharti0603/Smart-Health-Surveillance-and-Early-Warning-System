import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  // Example real-time alerts (later replace with API)
  final List<String> alerts = [
    "⚠️ High domestic violence cases reported in your district.",
    "📢 Local support camp available at Community Center.",
    "🚨 Emergency helpline is active 24/7.",
  ];

  // Awareness content (cards)
  final List<Map<String, String>> awarenessCards = [
    {
      "title": "Know Your Rights",
      "desc":
          "Every individual has the right to live free from violence. Learn about protective laws available for you."
    },
    {
      "title": "Myth vs Fact",
      "desc": "Myth: Domestic violence is a private issue.\nFact: It is a crime and punishable by law."
    },
    {
      "title": "How to Help",
      "desc":
          "If you know someone at risk, guide them to helplines and local support groups safely."
    },
  ];

  // Bottom navigation items
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      _buildHome(),
      _buildAwareness(),
      _buildHelp(),
      _buildAbout(),
    ]);
  }

  // SOS Call Function
  Future<void> _makeSOSCall() async {
    final Uri callUri = Uri(scheme: 'tel', path: '1091'); // Women Helpline India
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $callUri';
    }
  }

  // --- Pages ---

  Widget _buildHome() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "📢 Real-Time Alerts",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...alerts.map((a) => Card(
              color: Colors.red[50],
              child: ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: Text(a, style: const TextStyle(fontSize: 16)),
              ),
            )),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            "💡 Quote of the Day:\n\n“You are not alone, help is one step away.”",
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }

  Widget _buildAwareness() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: awarenessCards.length,
      itemBuilder: (context, index) {
        final card = awarenessCards[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const Icon(Icons.lightbulb, color: Colors.orange),
            title: Text(card["title"]!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            subtitle: Text(card["desc"]!),
          ),
        );
      },
    );
  }

  Widget _buildHelp() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("📞 Need Help?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _makeSOSCall,
            icon: const Icon(Icons.call, size: 28),
            label: const Text(
              "Call Helpline 1091",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("ℹ️ About This App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
              "This app is designed to raise awareness, provide safety information, and connect users to emergency support services."),
          SizedBox(height: 20),
          Text("🌐 Language Options: English | हिंदी | বাংলা | தமிழ்"),
        ],
      ),
    );
  }

  // --- Build UI ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Health - User"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _makeSOSCall,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.sos, size: 30),
        label: const Text("SOS", style: TextStyle(fontSize: 18)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: "Awareness"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Help"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}
