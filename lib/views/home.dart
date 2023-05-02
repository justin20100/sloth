import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/tools/button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Text("lalala home ${FirebaseAuth.instance.currentUser!.email}"),
            Button(label:'deconnection', onPressed: () async =>{
              await FirebaseAuth.instance.signOut(),
              Navigator.pushNamed(context, kIntersectionRoute),
            }),
          ],
        )
      ),
    );
  }
}
