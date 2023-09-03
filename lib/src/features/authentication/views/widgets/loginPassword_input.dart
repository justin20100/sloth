import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

@immutable
class LoginPasswordInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final initialValue;

  LoginPasswordInput(
      {this.onChanged,
      Key? key, String? this.initialValue})
      : super(key: key);

  @override
  State<LoginPasswordInput> createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      keyboardType: TextInputType.visiblePassword,
      onChanged: widget.onChanged,
      obscureText: _isObscured,
      autofocus: false,
      cursorColor: kMainTextColor,
      style: k14BasicTextStyle,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          splashRadius: 10,
          padding: const EdgeInsetsDirectional.only(end: 12),
          icon: _isObscured
              ? const Icon(Icons.visibility_rounded, color: kColorGreen,)
              : const Icon(Icons.visibility_off_rounded, color: kColorGreen,),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
        contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
        hintText: "Votre mot de passe",
        isDense: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kColorRed),
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
