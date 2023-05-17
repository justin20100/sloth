import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(String firstname, String lastname, String email,
      String phone, Map traits, Map objectifs, String user_id) {
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

  Future<Map<String, dynamic>> getUserFullName(String id) async {
    try {
      final querySnapshot = await usersRef
          .where('user_id', isEqualTo: id)
          .get(const GetOptions(source: Source.serverAndCache));
      if (querySnapshot.size > 0) {
        final userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return {
          'firstname': userData['firstname'],
          'lastname': userData['lastname'],
        };
      } else {
        return {};
      }
    } catch (error) {
      print('Failed to get user: $error');
      return {};
    }
  }
}
