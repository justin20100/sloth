import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

@immutable
class TextError extends StatelessWidget {
  final String text;

  const TextError({required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: kSmallHorizontalSpacer, top: kMicroVerticalSpacer),
      child: Text(text, style: kErrorStyle),
    );
  }
}
