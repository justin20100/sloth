import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Return as a string the id of the user connected
String getUserID(){
  String id = FirebaseAuth.instance.currentUser!.uid;
  return id;
}

// Return true if we have a connection to internet and false if not
Future<bool> checkInternetConnection() async {
  Connectivity connectivity = Connectivity();
  ConnectivityResult result = await connectivity.checkConnectivity();
  if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

// Return true if the connected user has not yet completed their daily report
checkDailyReportBox(){
  return true;
}