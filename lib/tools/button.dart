import 'package:flutter/material.dart';
import '../styles/constants.dart';

@immutable
class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const Button({required this.label, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 400.0,
        padding: const EdgeInsets.only(top: kSmallVerticalSpacer, bottom: kSmallVerticalSpacer),
        decoration: BoxDecoration(
            color: kColorGreen,
            boxShadow: kBoxShadowItem,
            borderRadius: kBorderRadiusItem
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: 'Inter',
            color: kColorWhite,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
