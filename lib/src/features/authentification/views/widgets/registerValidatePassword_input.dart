import 'package:flutter/material.dart';
import 'package:sloth/src/features/authentification/controllers/registerController.dart';
import 'package:sloth/src/kdatas/constants.dart';

@immutable
class RegisterValidatePasswordInput extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String password;

   const RegisterValidatePasswordInput(
      {this.onChanged, required this.password, Key? key})
      : super(key: key);

  @override
  State<RegisterValidatePasswordInput> createState() =>
      _RegisterValidatePasswordInputState();
}

class _RegisterValidatePasswordInputState extends State<RegisterValidatePasswordInput> {
  final RegisterController _registerController = RegisterController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ce champ ne peut pas être vide';
        }
        if (value != widget.password) {
          return 'Vérifiez vos mots de passe';
        }
        return null;
      },
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
              ? const Icon(
                  Icons.visibility_rounded,
                  color: kColorGreen,
                )
              : const Icon(
                  Icons.visibility_off_rounded,
                  color: kColorGreen,
                ),
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
          borderSide: const BorderSide(
            color: kColorGreen,
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
        errorStyle: const TextStyle(
          fontSize: 12,
          color: kColorRed,
          height: 0.6,
        ),
        fillColor: kColorWhite,
        filled: true,
      ),
    );
  }
}