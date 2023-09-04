import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sloth/src/utils/functions.dart';

class DReportModel {
  final CollectionReference dReportsRef =
      FirebaseFirestore.instance.collection('events');
  Tools tools = Tools();

  Future<void> createDReport(
      DateTime date,
      num anxiety,
      num cognitiveEvaluation,
      num euphoria,
      num mood,
      String moreInfos,
      num motivation,
      num physiqueEvaluation,
      DateTime sleep,
      num sleepEvaluation,
      num state,
      num stress,
      DateTime wakeup,
      String userId) {
    return dReportsRef
        .add({
          'type': "d",
          'date': date,
          'results': {
            'anxiety': anxiety,
            'cognitiveEvaluation': cognitiveEvaluation,
            'euphoria': euphoria,
            'mood': mood,
            'moreInfos': moreInfos,
            'motivation': motivation,
            'physiqueEvaluation': physiqueEvaluation,
            'sleep': sleep,
            'sleepEvaluation': sleepEvaluation,
            'state': state,
            'stress': stress,
            'wakeUp': wakeup,
          },
          'userId': userId,
        })
        .then((value) => print('Event added'))
        .catchError((error) => print('Failed to add event: $error'));
  }

  Future<bool> checkDReportForADay(day) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot = await dReportsRef
        .where('userId', isEqualTo: userId)
        .where('date',
            isGreaterThanOrEqualTo: DateTime(day.year, day.month, day.day - 1))
        .where('date', isLessThan: day)
        .where('type', isEqualTo: 'd')
        .get();
    if (querySnapshot.docs.isEmpty) {
      if (kDebugMode) {
        print("il n'y a pas encore de rapport journalier");
      }
      return false;
    } else {
      if (kDebugMode) {
        print("il y a déja un rapport journalier");
      }
      return true;
    }
  }

  Future getDReportInARange(DateTime startDay, DateTime LastDay) async {
    final userId = await tools.getUserID();
    QuerySnapshot dReportSnapshot = await dReportsRef
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: startDay)
        .where('date', isLessThan: LastDay)
        .where('type', isEqualTo: 'd')
        .get();

    List dReportList = [];

    dReportSnapshot.docs.forEach((doc) {
      dReportList.add(doc.data());
    });
    return dReportList;
  }
}
