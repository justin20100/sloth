import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

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
      autocorrect: false,
      cursorColor: kMainTextColor,
      style: k14BasicTextStyle,
      textInputAction: TextInputAction.next,
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
    ),);
  }
}
