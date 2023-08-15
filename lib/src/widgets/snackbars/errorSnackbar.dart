import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class ErrorSnackbar extends StatelessWidget {
  final String error;

  const ErrorSnackbar({Key? key, required this.error}) : super(key: key);

  static void show(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kColorRed,
        content: Text(error),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
