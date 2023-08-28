import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class SuccessSnackbar extends StatelessWidget {
  final String error;

  const SuccessSnackbar({Key? key, required this.error}) : super(key: key);

  static void show(BuildContext context, String success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kColorGreen,
        content: Text(success, style: kSuccessSnackBarTextStyle,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
