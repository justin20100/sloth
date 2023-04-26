import 'package:flutter/material.dart';
import 'package:sloth/partials/forms/text_input.dart';
import '../../styles/constants.dart';

@immutable
class SearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchInput({this.onChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kSmallHorizontalSpacer,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kBorderRadiusItem,
            boxShadow: kBoxShadowItem),
        child: TextInput(
            hintText: 'Votre recherche',
            keyboardType: TextInputType.text,
            validator: (value) {},
            onChanged: onChanged,
            autofocus: false),
      ),
    );
  }
}
