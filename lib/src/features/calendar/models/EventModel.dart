import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sloth/src/utils/functions.dart';

class EventModel {
  final CollectionReference eventsRef = FirebaseFirestore.instance
      .collection('events');

  Future<Map<DateTime, List<Map<String, dynamic>>>> loadAllFirestoreEvents(
      DateTime kfirstDay, DateTime kLastDay) async {
    final userId = await getUserID();
    QuerySnapshot eventsSnapshot = await eventsRef
        .where('userId', isEqualTo: userId)
        .where('date', isGreaterThanOrEqualTo: kfirstDay)
        .where('date', isLessThan: kLastDay)
        .get();
    Map<DateTime, List<Map<String, dynamic>>> eventsMap = {};
    eventsSnapshot.docs.forEach((eventDoc) {
      DateTime eventDate = eventDoc.get('date').toDate();
      eventDate = DateTime(eventDate.year, eventDate.month,eventDate.day).toUtc();
      final event = {
        'date': eventDoc.get('date').toDate(),
        'results': eventDoc.get('results'),
        'type': eventDoc.get('type'),
      };

      if (eventsMap.containsKey(eventDate)) {
        eventsMap[eventDate]!.add(event);
      } else {
        eventsMap[eventDate] = [event];
      }
    });
    return eventsMap;
  }
}
