import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

class PatientList extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Patients")),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getPatients(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final patients = snapshot.data!.docs;
          return ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) {
              var patient = patients[index];
              return ListTile(
                title: Text(patient['name']),
                subtitle: Text("Age: ${patient['age']} | Condition: ${patient['condition']}"),
              );
            },
          );
        },
      ),
    );
  }
}
