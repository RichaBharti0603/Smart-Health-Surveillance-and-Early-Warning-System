import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _conditionController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Patient")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (val) => val!.isEmpty ? "Enter name" : null,
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Age"),
                validator: (val) => val!.isEmpty ? "Enter age" : null,
              ),
              TextFormField(
                controller: _conditionController,
                decoration: InputDecoration(labelText: "Condition"),
                validator: (val) => val!.isEmpty ? "Enter condition" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _firestoreService.addPatient(
                      _nameController.text,
                      int.parse(_ageController.text),
                      _conditionController.text,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
