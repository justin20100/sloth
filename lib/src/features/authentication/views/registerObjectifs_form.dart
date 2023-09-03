import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentication/controllers/registerObjectifsController.dart';
import 'package:sloth/src/features/authentication/datas/AppObjectifs.dart';
import 'package:sloth/src/features/authentication/models/UserModel.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sloth/src/widgets/error_text.dart';
import 'package:sloth/src/widgets/snackbars/error_snackbar.dart';
import 'package:sloth/src/widgets/snackbars/welcome_snackbar.dart';

class RegisterObjectifsForm extends StatefulWidget {
  RegisterObjectifsForm({Key? key}) : super(key: key);

  @override
  State<RegisterObjectifsForm> createState() => _RegisterObjectifsFormState();
}

class _RegisterObjectifsFormState extends State<RegisterObjectifsForm> {
  final UserModel _userModel = UserModel();
  SelectedCountController selectedCountController = SelectedCountController();
  final Tools tools = Tools();
  final _registerObjectifsFormKey = GlobalKey<FormState>();
  final List<int> _selectedObjectifs = [];
  int _selectedCount = 0;

  Type updateSelectedCount(value) {
    if (value == true) {
      _selectedCount++;
    } else {
      _selectedCount--;
    }
    return Null;
  }

  checkSelectedObjectifs(id){
    if(_selectedObjectifs.contains(id)){
      _selectedObjectifs.remove(id);
    }else{
      _selectedObjectifs.add(id);
    }
  }

  Future<void> _submitForm() async {
    bool isValid = true;
    setState(() {
      isValid = selectedCountController.validate(context, _selectedCount) && isValid;
      isValid;
    });
    if (isValid) {
      if (await tools.checkInternetConnection()) {
        try {
          Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          await _userModel.addUserToFirebaseAuth(arguments['email'], arguments['password']);
          final userId = FirebaseAuth.instance.currentUser!.uid;
          await _userModel.addUserToFirestore(
            arguments['firstname'],
            arguments['lastname'],
            arguments['email'],
            arguments['phone'],
            {
              'q1': arguments['q1'],
              'q2': arguments['q2'],
              'q3': arguments['q3'],
              'q4': arguments['q4'],
              'q5': arguments['q5'],
              'q6': arguments['q6'],
              'q7': arguments['q7'],
              'q8': arguments['q8'],
            },
            _selectedObjectifs,
            userId,
          );
          Navigator.pushNamed(context, kHomeRoute);
          WelcomeSnackbar.show(context, AppLocalizations.of(context)!.snackbar__welcomeMessage);
        } catch (e) {
          ErrorSnackbar.show(context, AppLocalizations.of(context)!.registerObjectifs__error);
        }
      } else {
        ErrorSnackbar.show(context, AppLocalizations.of(context)!.registerObjectifs__internetError);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorCream,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
              child: Column(
                children: [
                  // Intro text
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),
                  Text(
                    AppLocalizations.of(context)!.registerObjectifs__title,
                    style: kMegaLabelTextStyle,
                  ),
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),
                  Text(AppLocalizations.of(context)!.registerObjectifs__introText1, style: k16BasicTextStyle),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  _selectedCount >= 2
                      ? Text(
                    AppLocalizations.of(context)!.registerObjectifs__introText2Valid,
                    style: k16BasicTextStyle,
                  ) : Text(
                    AppLocalizations.of(context)!.registerObjectifs__introText2,
                    style: k16BasicTextStyle,
                  ),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  selectedCountController.error != null
                      ? Text(selectedCountController.error!, style: kObjectifsErrorStyle, )
                      : const SizedBox(
                          height: 0,
                        ),
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  ),

                  // Form
                  Form(
                    key: _registerObjectifsFormKey,
                    child: Column(
                      children: objectifs.map((AppObjectifs objectif) {
                        return Column(
                          children: [
                            Material(
                              elevation: 2.0,
                              shadowColor: kColorGrey,
                              borderRadius: BorderRadius.circular(10),
                              child: CheckboxListTile(
                                title: Text(
                                  objectif.title ?? '',
                                  style: TextStyle(
                                    color: objectif.value ? kColorWhite : kColorGreen,
                                    fontSize: 14,
                                  ),
                                ),
                                tileColor: objectif.value ? kColorGreen : kColorWhite,
                                value: objectif.value,
                                checkColor: kColorYellow,
                                activeColor: kColorGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => objectif.value ? const BorderSide(width: 1, color: kColorWhite) : const BorderSide(width: 1, color: kColorGreen),
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    updateSelectedCount(value);
                                    checkSelectedObjectifs(objectif.id);
                                    objectif.value = !objectif.value;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16.0, // Ajustez la hauteur en fonction de vos besoins.
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  // Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.registerObjectifs__backButton,
                          style: kSmallLinkGreenText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Button(
                          label: AppLocalizations.of(context)!.registerObjectifs__button,
                          onPressed: () {
                            _submitForm();
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: kBigVerticalSpacer,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
