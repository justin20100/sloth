import 'package:cloud_firestore/cloud_firestore.dart';

class TraitModel {
  final CollectionReference traitsRef = FirebaseFirestore.instance.collection('users/traits');

  Future<void> createBook(
      num q1, num q2, num q3, num q4, num q5, num q6, num q7, num q8) {
    return traitsRef
        .add({
          'q1': q1,
          'q2': q2,
          'q3': q3,
          'q4': q4,
          'q5': q5,
          'q6': q6,
          'q7': q7,
          'q8': q8,
        })
        .then((value) => print('Trait added'))
        .catchError((error) => print('Failed to add trait: $error'));
  }
}
