import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventsModel {
  final CollectionReference dReportsRef =
      FirebaseFirestore.instance.collection('events/WHYbK3b8jyIaKk2IXnwg/dreports');
  final CollectionReference wReportsRef =
      FirebaseFirestore.instance.collection('wreports');
  final CollectionReference analisisRef =
      FirebaseFirestore.instance.collection('analisis');

  Future<void> createDReport(
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
      stress,
      DateTime wakeup,
      String user_id) {
    return dReportsRef
        .add({
          'date': date,
          'results': {
            'anxiety': anxiety,
            'cognitiveevaluation': cognitiveevaluation,
            'euphoria': euphoria,
            'mood': mood,
            'moreinfos': moreinfos,
            'motivation': motivation,
            'physiqueevaluation': physiqueevaluation,
            'sleep': sleep,
            'sleepevaluation': sleepevaluation,
            'state': state,
            'stress': stress,
            'wakeup': wakeup,
          },
          'user_id': user_id,
        })
        .then((value) => print('Event added'))
        .catchError((error) => print('Failed to add event: $error'));
  }
}
