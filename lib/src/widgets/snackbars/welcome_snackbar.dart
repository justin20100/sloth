import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class WelcomeSnackbar extends StatelessWidget {
  final String message;

  const WelcomeSnackbar({Key? key, required this.message}) : super(key: key);

  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          elevation: 20,
          duration: const Duration(seconds: 15),
          backgroundColor: kColorGreen,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          content: Container(
              color: kColorGreen,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: kColorWhite,
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kSmallVerticalSpacer,
                  ),
                  const Image(
                    height: 80,
                    image: AssetImage('assets/img/logowhite.png'),
                  ),
                  const SizedBox(
                    height: kMicroVerticalSpacer,
                  ),
                  Text(message,
                    style: const TextStyle(
                        color: kColorWhite, fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(
                    height: kNormalVerticalSpacer,
                  ),
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
