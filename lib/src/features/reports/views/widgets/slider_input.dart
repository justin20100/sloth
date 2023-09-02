import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class Slider_input extends StatefulWidget {
  final ValueChanged<double>? onChanged;
  final value;

  const Slider_input({Key? key, required this.value, this.onChanged}) : super(key: key);

  @override
  State<Slider_input> createState() => _Slider_inputState();
}

class _Slider_inputState extends State<Slider_input> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: kColorGreen,
        activeTrackColor: kColorGreen,
        inactiveTrackColor: kColorYellow,
        overlayColor: Colors.blue.withOpacity(0.3),
        trackHeight: 6.0,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 12.0,
          elevation: 1.0,
          pressedElevation: 0,
        ),
        overlayShape:
        const RoundSliderOverlayShape(overlayRadius: 0.0),
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      child: Slider(
        value: widget.value,
        min: 0.0,
        max: 100.0,
        onChanged: widget.onChanged,
      ),
    );
  }
}
