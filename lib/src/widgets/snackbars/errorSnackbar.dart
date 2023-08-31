import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class ErrorSnackbar extends StatelessWidget {
  final String error;

  const ErrorSnackbar({Key? key, required this.error}) : super(key: key);

  static void show(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        duration: Duration(seconds: 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: kColorDarkGreen,
        content: Padding(
          padding: EdgeInsets.only(top: kMicroVerticalSpacer, bottom: kMicroVerticalSpacer),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/img/noConnection.png', width: 100),
              SizedBox(
                width: kBigHorizontalSpacer,
              ),
              Expanded(
                  child: Text(
                error,
                style: kSuccessSnackBarErrorTextStyle,
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
