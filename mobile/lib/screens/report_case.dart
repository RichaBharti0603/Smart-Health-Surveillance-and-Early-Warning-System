// lib/screens/report_case.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReportCaseScreen extends StatefulWidget {
  const ReportCaseScreen({super.key});

  @override
  State<ReportCaseScreen> createState() => _ReportCaseScreenState();
}

class _ReportCaseScreenState extends State<ReportCaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _submitCase() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final response = await http.post(
      Uri.parse("https://your-api-url.com/api/report-case"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "patientName": _patientNameController.text,
        "location": _locationController.text,
        "symptoms": _symptomsController.text,
        "reportedBy": "ASHA Worker", // can be dynamic
      }),
    );

    setState(() => _isSubmitting = false);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Case reported successfully ✅")),
      );
      _patientNameController.clear();
      _locationController.clear();
      _symptomsController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Failed to report case")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report Case")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _patientNameController,
                decoration: const InputDecoration(labelText: "Patient Name"),
                validator: (value) =>
                    value!.isEmpty ? "Enter patient name" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: "Location"),
                validator: (value) =>
                    value!.isEmpty ? "Enter location" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _symptomsController,
                decoration: const InputDecoration(labelText: "Symptoms"),
                validator: (value) =>
                    value!.isEmpty ? "Enter symptoms" : null,
              ),
              const SizedBox(height: 20),
              _isSubmitting
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitCase,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Submit Case"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
