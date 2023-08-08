import 'package:cloud_firestore/cloud_firestore.dart';

class EventsModel {
  final CollectionReference dReportsRef = FirebaseFirestore.instance
      .collection('events/WHYbK3b8jyIaKk2IXnwg/dreports');
  final CollectionReference wReportsRef = FirebaseFirestore.instance
      .collection('events/WHYbK3b8jyIaKk2IXnwg/wreports');
  final CollectionReference analisisRef = FirebaseFirestore.instance
      .collection('events/WHYbK3b8jyIaKk2IXnwg/analisis');

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
      num stress,
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

  // get
  /*Future<Map> getADRepport(DateTime date, user_id) async {
    try {
      final querySnapshot = await dReportsRef
          .where('date', isEqualTo: date, 'user_id', is)
          .get(const GetOptions(source: Source.serverAndCache));
      if (querySnapshot.size > 0) {
        final eventData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return {
          'date': eventData['date'],
          'results': {
            'anxiety': eventData['results']['anxiety'],
            'cognitiveevaluation': eventData['results']['cognitiveevaluation'],
            'euphoria': eventData['results']['euphoria'],
            'mood': eventData['results']['mood'],
            'moreinfos': eventData['results']['moreinfos'],
            'motivation': eventData['results']['motivation'],
            'physiqueevaluation': eventData['results']['physiqueevaluation'],
            'sleep': eventData['results']['sleep'],
            'sleepevaluation': eventData['results']['sleepevaluation'],
            'state': eventData['results']['state'],
            'stress': eventData['results']['stress'],
            'wakeup': eventData['results']['wakeup'],
          },
          'user_id': eventData['user_id'],
        };
      } else {
        return {};
      }
    } catch (error) {
      print('Failed to get user: $error');
      return {};
    }
  }*/
}
