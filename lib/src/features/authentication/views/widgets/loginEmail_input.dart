import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class LoginEmailInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  bool hasError = false;

  LoginEmailInput({Key? key, this.initialValue, this.onChanged,}) : super(key: key);

  @override
  State<LoginEmailInput> createState() => _LoginEmailInputState();
}

class _LoginEmailInputState extends State<LoginEmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: widget.onChanged,
      obscureText: false,
      autofocus: false,
      autocorrect: false,
      cursorColor: kMainTextColor,
      style: k14BasicTextStyle,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
        hintText: "exemple@mail.com",
        isDense: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: kColorRed,
              width: 20
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusColor: kColorYellow,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kColorYellow,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        fillColor: kColorWhite,
        filled: true,
      ),
    );
  }
}
