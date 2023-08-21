// firebase_helper.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> SeedEventsToFb() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

final CollectionReference dReportsRef = FirebaseFirestore.instance
    .collection('events');

Future<void> seedDReport(
    DateTime date,
    num anxiety,
    num cognitiveevaluation,
    num euphoria,
    num mood,
    String moreinfos,
    num motivation,
    num physiqueevaluation,
    DateTime sleep,
    num sleepevaluation,
    num state,
    num stress,
    DateTime wakeup,
    String userId) {
  return dReportsRef
      .add({
    'type':"d",
    'date': DateTime.now(),
    'results': {
      'anxiety': 2,
      'cognitiveevaluation': 3,
      'euphoria': 4,
      'mood': 5,
      'moreinfos': 'une petite sieste',
      'motivation': 4,
      'physiqueevaluation': 2,
      'sleep': DateTime.now(),
      'sleepevaluation': 8,
      'state': 5,
      'stress': 4,
      'wakeup': DateTime.now(),
    },
    'userId': 'Q2zIjsrceBVIgJzATaeygOoQwFG3',
  })
      .then((value) => print('Event added'))
      .catchError((error) => print('Failed to add event: $error'));
}