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
      style: k14BasicTextStyle,
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
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kColorYellow,
              ),
            borderRadius: BorderRadius.circular(7),
          ),
          errorStyle: TextStyle(
            fontSize: 12,
            color: kColorRed,
            height: 0.6,

          ),
      fillColor: kColorWhite,
      filled: true,
    ),);
  }
}
