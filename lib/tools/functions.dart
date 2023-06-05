import 'package:firebase_auth/firebase_auth.dart';

String getUserID(){
  String id = FirebaseAuth.instance.currentUser!.uid;
  return id;
}