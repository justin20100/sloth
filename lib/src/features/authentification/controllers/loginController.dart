import 'package:firebase_auth/firebase_auth.dart';

class RegisterController {
  checkPassword(email, password) async {
    try {UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'wrong-password') {
        return true;
      } else {
        return false;
      }
    }
  }
}
