import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

// create a new user
  Future<void> addUserToFirebaseAuth(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (kDebugMode) {
        print('User created in Firebase Auth');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Failed to create user in Firebase Auth: $error');
      }
      rethrow; // Rethrow the error to handle it in the calling code.
    }
  }

  Future<void> addUserToFirestore(
    String firstname,
    String lastname,
    String email,
    String phone,
    Map traits,
    List objectifs,
    String userId,
  ) async {
    try {
      await usersRef.doc(userId).set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
        'traits': traits,
        'objectifs': objectifs,
        'user_id': userId,
      });
      if (kDebugMode) {
        print('User added to Firestore');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Failed to add user to Firestore: $error');
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUserFullName(String id) async {
    try {
      final querySnapshot = await usersRef
          .where('user_id', isEqualTo: id)
          .get(const GetOptions(source: Source.serverAndCache));
      if (querySnapshot.size > 0) {
        final userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
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

  Future<Map<String, dynamic>> getUserProfileInfos(String id) async {
    try {
      final querySnapshot = await usersRef
          .where('user_id', isEqualTo: id)
          .get(const GetOptions(source: Source.serverAndCache));
      if (querySnapshot.size > 0) {
        final userData =
        querySnapshot.docs.first.data() as Map<String, dynamic>;
        return {
          'id': userData['id'],
          'firstname': userData['firstname'],
          'lastname': userData['lastname'],
          'email': userData['email'],
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
