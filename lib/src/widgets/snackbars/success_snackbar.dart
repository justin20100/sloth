import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class SuccessSnackbar extends StatelessWidget {
  const SuccessSnackbar({Key? key}) : super(key: key);

  static void show(BuildContext context, String success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10),
        )),
        duration: const Duration(seconds: 10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: kColorDarkGreen,
        content: Padding(
          padding: const EdgeInsets.only(top: kNormalVerticalSpacer, right: kNormalHorizontalSpacer ,bottom: kNormalVerticalSpacer, left: kNormalHorizontalSpacer),
          child: Expanded(
              child: Text(
            success,
            style: kSuccessSnackBarErrorTextStyle,
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
