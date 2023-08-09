import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class SelectListInput extends StatefulWidget {
  late final value;
  final String hintText;
  final List<String> list;
  final ValueChanged<String?>? onChanged;


  SelectListInput({Key? key, this.value, required this.hintText, required this.list, this.onChanged}) : super(key: key);

  @override
  State<SelectListInput> createState() => _SelectListInputState();
}

class _SelectListInputState extends State<SelectListInput> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const ShapeDecoration(
        color: kColorWhite,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: kColorGreen),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kSmallHorizontalSpacer),
        child: DropdownButton<String>(
          value: widget.value,
          isExpanded: true,
          underline: const SizedBox(),
          hint: const Text('Sélectionnez une option'),
          onChanged: widget.onChanged,
          items: widget.list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: k16BasicTextStyle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
