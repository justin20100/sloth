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
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: kColorGreen,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
              textStyle: kButtonTextStyle,
            ),
            onPressed: onPressed,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
