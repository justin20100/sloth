import 'package:flutter/material.dart';
import '../../data/echelleTraits_datas.dart';
import '../../styles/constants.dart';
import '../../tools/button.dart';

class RegisterTraitsForm extends StatelessWidget {
  RegisterTraitsForm({Key? key}) : super(key: key);
  final _registerTraitsFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kColorCream,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded , color: kColorGreen),
            tooltip: 'back to home page',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Echelle de Traits', style: kBigGreenText,)
      ),
      backgroundColor: kColorCream,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: kNormalHorizontalSpacer*2, right: kNormalHorizontalSpacer*2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Form(
                    key: _registerTraitsFormKey,
                    child: Column(
                      children: echelleTraitsDatas.map((element){
                        return Column(
                          children: [
                            Text(element.label)
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Button(
                        label: 'Derniere etape',
                        onPressed: () {
                          if (_registerTraitsFormKey.currentState != null && _registerTraitsFormKey.currentState!.validate()) {
                            //Navigator.pushNamed(context, kRegisterMoreRoute, arguments: { 'email': arguments['email'] , 'password': arguments['password']}  );
                          }
                        }),
                  ),
                ],
              )
          )
      ),
    );
  }
}
