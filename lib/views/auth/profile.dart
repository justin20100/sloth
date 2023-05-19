import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/tools/button.dart';
import '../../styles/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorCream,
      appBar: AppBar(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: kColorCream,
        leading: GestureDetector(
          onTap: ()=>{Navigator.pop(context)},
          child: const Icon( Icons.arrow_back_ios_new_rounded , color: kColorGreen,),
        ),
        title: const Text('Profile', style: kheadingPageTextStyle,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child:Button(label: 'Déconnection', onPressed: ()=>{
            FirebaseAuth.instance.signOut(),
            Navigator.popAndPushNamed(context, kIntersectionRoute),
          })),
        ],
      )
    );
  }
}
