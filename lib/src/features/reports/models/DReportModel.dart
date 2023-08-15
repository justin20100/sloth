import 'package:cloud_firestore/cloud_firestore.dart';

class DReportModel {
  final CollectionReference dReportsRef = FirebaseFirestore.instance
      .collection('events/WHYbK3b8jyIaKk2IXnwg/dreports');

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
      String userId) {
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
          'userId': userId,
        })
        .then((value) => print('Event added'))
        .catchError((error) => print('Failed to add event: $error'));
  }
}
