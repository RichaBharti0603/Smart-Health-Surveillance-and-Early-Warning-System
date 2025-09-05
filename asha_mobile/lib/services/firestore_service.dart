import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a patient
  Future<void> addPatient(String name, int age, String condition) {
    return _db.collection('patients').add({
      'name': name,
      'age': age,
      'condition': condition,
      'addedAt': FieldValue.serverTimestamp(),
    });
  }

  // Stream patients (auto-refresh)
  Stream<QuerySnapshot> getPatients() {
    return _db.collection('patients').orderBy('addedAt', descending: true).snapshots();
  }

  // Stream alerts
  Stream<QuerySnapshot> getAlerts() {
    return _db.collection('alerts').orderBy('createdAt', descending: true).snapshots();
  }
}
