import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class TimePickerInput extends StatefulWidget {
  final TextEditingController controller;
  final onChange;

  const TimePickerInput({Key? key, required this.controller, required this.onChange}) : super(key: key);

  @override
  _TimePickerInputState createState() => _TimePickerInputState();
}

class _TimePickerInputState extends State<TimePickerInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: widget.controller,
      onTap: widget.onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kSmallVerticalSpacer),
        hintText: '08:20',
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
      ),
    );
  }

  Future<void> _onTimeChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            timePickerTheme: TimePickerThemeData(
                backgroundColor: kColorCream,
                hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? kColorYellow
                        : kColorGreen),
                hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? kColorGreen
                        : kColorCream),
                dialHandColor: kColorGreen,
                dialBackgroundColor: kColorYellow,
                dialTextColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.selected)
                        ? kColorYellow
                        : kColorCream),
                entryModeIconColor: kColorGreen),
            textTheme: const TextTheme(
              labelSmall: TextStyle(
                color: kColorGreen,
              ),
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => kColorGreen),
              overlayColor:
                  MaterialStateColor.resolveWith((states) => kColorGreen),
            )),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      String formattedTime = pickedTime.format(context);
      setState(() {
        widget.controller.text = formattedTime;
      });
    }
  }
}
