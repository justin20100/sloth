import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sloth/src/kdatas/variables.dart';

class HomeModel {
  final CollectionReference dReportsRef = FirebaseFirestore.instance
      .collection('events');

  Future<bool> checkIfReportAlreadyCompleted() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await dReportsRef
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: kYesterday)
        .where('date', isLessThan: kToday)
        .get();
    if (querySnapshot.docs.isEmpty) {
      if (kDebugMode) {
        print("il n'y a pas de rapport");
      }
      return false;
    } else {
      if (kDebugMode) {
        print("il y a déja un rapport");
      }
      return true;
    }
  }
}
