import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sloth/src/kdatas/variables.dart';

class HomeModel {
  final CollectionReference dReportsRef = FirebaseFirestore.instance.collection('events/WHYbK3b8jyIaKk2IXnwg/dreports');

  Future<bool> checkIfReportAlreadyCompleted() async {
    QuerySnapshot querySnapshot = await dReportsRef
        .where('date', isGreaterThanOrEqualTo: kYesterday)
        .where('date', isLessThan: kToday)
        .get();
    if(querySnapshot.docs.isEmpty){
      if (kDebugMode) {
        print('report not already completed');
      }
      return false;
    } else{
      if (kDebugMode) {
        print('report already completed');
      }
      return true;
    }
  }
}
