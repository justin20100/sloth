import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../styles/constants.dart';

@immutable
class TextInput extends StatelessWidget {
  const TextInput({
    this.hintText = "",
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.obscureText = false,
    this.autofocus = false,
    this.onChanged,
    this.value,
    Key? key})
      : super(key: key);
  final String hintText;
  final bool obscureText;
  final bool autofocus;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final ValueChanged<String>? onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      autofocus: autofocus,
      cursorColor: kMainTextColor,
      style: k16BasicTextStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
          hintText: hintText,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kColorGreen,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusColor: kColorYellow,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: kColorYellow,
              )),
          errorStyle: TextStyle(),
      fillColor: kColorWhite,
      filled: true,
    ),);
  }
}
