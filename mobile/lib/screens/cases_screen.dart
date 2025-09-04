import 'package:flutter/material.dart';

class CasesScreen extends StatefulWidget {
  const CasesScreen({super.key});

  @override
  State<CasesScreen> createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  final _formKey = GlobalKey<FormState>();
  String patientName = "";
  String village = "";
  String symptoms = "";
  String severity = "Mild";

  InputDecoration _fieldDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.teal),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.teal, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text("Report Health Case"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text("Enter Case Details",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.teal)),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: _fieldDecoration("Patient Name", Icons.person),
                    onSaved: (value) => patientName = value ?? "",
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: _fieldDecoration("Village / Location", Icons.home),
                    onSaved: (value) => village = value ?? "",
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    maxLines: 3,
                    decoration: _fieldDecoration("Symptoms", Icons.medical_services),
                    onSaved: (value) => symptoms = value ?? "",
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: severity,
                    items: ["Mild", "Moderate", "Severe"]
                        .map((level) => DropdownMenuItem(
                              value: level,
                              child: Text(level),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        severity = value!;
                      });
                    },
                    decoration: _fieldDecoration("Severity", Icons.warning),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.teal,
                            content: Text(
                              "Case submitted: $patientName ($severity)",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Submit Case",
                        style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
