import 'package:flutter/material.dart';

class CasesScreen extends StatefulWidget {
  const CasesScreen({super.key});

  @override
  State<CasesScreen> createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name, age, symptoms, village;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Case reported: $name, Age: $age, Village: $village, Symptoms: $symptoms"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Health Case"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                onSaved: (val) => name = val,
                validator: (val) => val!.isEmpty ? "Enter name" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                onSaved: (val) => age = val,
                validator: (val) => val!.isEmpty ? "Enter age" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Village/Location"),
                onSaved: (val) => village = val,
                validator: (val) => val!.isEmpty ? "Enter village" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Symptoms"),
                maxLines: 3,
                onSaved: (val) => symptoms = val,
                validator: (val) =>
                    val!.isEmpty ? "Enter symptoms (fever, diarrhea…)" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Submit Report"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
