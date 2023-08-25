import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class WReportModel {
  final CollectionReference dReportsRef = FirebaseFirestore.instance.collection('events');

  Future<bool> checkWReportForAWeek(today) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await dReportsRef
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: DateTime(today.year, today.month, today.day))
        .where('date', isLessThan: DateTime(today.year, today.month, today.day+1))
        .where('type', isEqualTo: 'w')
        .get();
    if (querySnapshot.docs.isEmpty) {
      if (kDebugMode) {
        print("il n'y a pas de rapport hebdomadaire");
      }
      return false;
    } else {
      if (kDebugMode) {
        print("il y a déja un rapport hebdomadaire");
      }
      return true;
    }
  }
}
