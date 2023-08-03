import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

String getUserID(){
  String id = FirebaseAuth.instance.currentUser!.uid;
  return id;
}


Future<bool> checkInternetConnection() async {
  Connectivity connectivity = Connectivity();
  ConnectivityResult result = await connectivity.checkConnectivity();
  if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}