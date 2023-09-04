import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentication/models/UserModel.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/snackbars/error_snackbar.dart';
import 'package:sloth/src/widgets/snackbars/success_snackbar.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {

  late Map user = {};
  bool isUserLoaded = false;

  Tools tools = Tools();
  UserModel userModel = UserModel();

  @override
  initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final user_id = FirebaseAuth.instance.currentUser!.uid;
    user = await userModel.getUserProfileInfos(user_id);
    setState(() {
      isUserLoaded = true;
    });
  }


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
          leading: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
            child: GestureDetector(
              onTap: () => {Navigator.popAndPushNamed(context, kHomeRoute)},
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kColorGreen,
              ),
            ),
          ),
          title: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
            child: const Text(
              'Compte',
              style: kAppBarTextStyle,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //profil icon
            Center(
              child: Icon(Icons.account_box_rounded , size: 200,color: kColorGreen,),
            ),
            SizedBox(height: kMicroVerticalSpacer*2,),
            isUserLoaded ? Text(user['firstname']+' '+user['lastname'], style: kBigLabelTextStyle,):const Text(' ', style: kBigLabelTextStyle,),
            SizedBox(height: kMicroVerticalSpacer*2,),
            isUserLoaded ? Text(user['email'], style: k16BasicTextStyle,):const Text(' ', style: kLabelGreenText,),
            SizedBox(height: kBigVerticalSpacer*2,),
            // Reset password
            GestureDetector(
              onTap: () async{
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email!);
                    SuccessSnackbar.show(context,"Email de modification du mot de passe envoyé");
                  } catch (e) {
                    ErrorSnackbar.show(context, "Une erreur est survenue lors de l'envoie de l'email de modification du mot de passe");
                  }
                } else {
                  print('Aucun utilisateur n\'est actuellement connecté.');
                }
              },
              child: Text(
                AppLocalizations.of(context)!.profile__linkPassword,
                style: kSmallLinkGreenText,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: kBigVerticalSpacer),
            // Logout
            Center(
                  child: Button(
                      label: 'Déconnection',
                      onPressed: () => {
                            FirebaseAuth.instance.signOut(),
                            Navigator.popAndPushNamed(
                                context, kIntersectionRoute),
                          })
            ),
          ],
        ));
  }
}
