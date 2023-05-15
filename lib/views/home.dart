import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/styles/constants.dart';
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
      backgroundColor: kColorCream,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: kColorCream,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()=>{Navigator.pushNamed(context, kNotificationsRoute)},
          child: const Padding(
            padding: EdgeInsets.only(left: kSmallHorizontalSpacer),
            child: Icon(Icons.menu_rounded,color: kColorGreen, size: 40,),
          ),
        ),
        title: Image.asset('assets/img/slothLogo.jpg', width: 210),
        actions: [
          GestureDetector(
            onTap: ()=>{Navigator.pushNamed(context, kNotificationsRoute)},
            child: const Padding(
              padding: EdgeInsets.only(right: kSmallHorizontalSpacer),
              child:Icon(Icons.notifications_rounded,color: kColorGreen, size: 35),
            ),
          ),
        ],
      ),
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
