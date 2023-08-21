import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/utils/functions.dart';

class EventModel {
  final CollectionReference eventsRef = FirebaseFirestore.instance
      .collection('events');

  loadAllFirestoreEvents(
      DateTime kfirstDay, DateTime kLastDay) async {
    final userId = await getUserID();
    QuerySnapshot eventsSnapshot = await eventsRef
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: kfirstDay)
        .where('date', isLessThan: kLastDay)
        .get();

    Map<DateTime, dynamic> eventsMap = {};
    eventsSnapshot.docs.forEach((eventDoc) {
      DateTime eventDate = eventDoc.get('date').toDate();

    });

    return eventsMap;
  }
}
