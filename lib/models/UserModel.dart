import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(String firstname, String lastname, String email, String phone, Map traits, Map objectifs, String user_id) {
    return usersRef
        .add({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'traits': traits,
      'objectifs': objectifs,
      'user_id': user_id,
    })
        .then((value) => print('User added'))
        .catchError((error) => print('Failed to add user: $error'));
  }
}