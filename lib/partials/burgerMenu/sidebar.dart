import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/models/UserModel.dart';
import 'package:sloth/routes/routes.dart';
import 'package:sloth/styles/constants.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  _SidebarScreenState createState() => _SidebarScreenState();
}


class _SidebarScreenState extends State<SidebarScreen> {
  late UserModel _userModel;
  late Map user = {};
  bool isUserLoaded = false;


  @override
  void initState() {
    super.initState();
    _userModel = UserModel();
    getUser();
  }

  Future<void> getUser() async {
    final user_id = FirebaseAuth.instance.currentUser!.uid;
    user = await _userModel.getUserFullName(user_id);
    setState(() {
      isUserLoaded = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => !(Navigator.of(context).userGestureInProgress),
    child: Container(
      decoration: const BoxDecoration(
        color: kColorCream,
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kMicroVerticalSpacer, horizontal: kBigHorizontalSpacer),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              const SizedBox(height: kSmallVerticalSpacer,),
              Image.asset('assets/img/logoBM.jpg', width: 150),
              isUserLoaded ? Text(user['firstname']+' '+user['lastname']+' est connecté', style: kBurgerMenuSmallTextStyle,):const Text(' ', style: kBurgerMenuSmallTextStyle,),
              const SizedBox(height: kBigVerticalSpacer,),
              // Part 1
              const Text('Objectifs et succès', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Text('Médicaments', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Text('Fiche personnel', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Text('Articles', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kBigVerticalSpacer,),
              // Part 2
              const Text('Chronologie', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Text('Statistiques', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Text('Slotheurs zone', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Spacer(),
              // Part 3
              GestureDetector(
                onTap: ()=>{Navigator.pushNamed(context, kProfileRoute)},
                child: const Text('Compte', style: kBurgerMenuTextStyle,),
              ),
              const SizedBox(height: kSmallVerticalSpacer,),
              const Text('Paramètres', style: kBurgerMenuTextStyle,),
              const SizedBox(height: kBigVerticalSpacer,),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
