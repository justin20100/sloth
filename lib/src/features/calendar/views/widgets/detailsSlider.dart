import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class DetailsSlider extends StatelessWidget {
  double data;

  DetailsSlider({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SliderTheme(
        data: SliderThemeData(
          thumbColor: kColorGreen,
          activeTrackColor: kColorGreen,
          inactiveTrackColor: kColorYellow,
          overlayColor: Colors.blue.withOpacity(0.3),
          trackHeight: 6.0,
          thumbShape: SliderComponentShape.noThumb,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
          inactiveTickMarkColor: Colors.transparent,
          activeTickMarkColor: Colors.transparent,
        ),
        child: Slider(
          value: data,
          min: 0.0,
          max: 5.0,
          divisions: 10,
          onChanged: ( value) {},
        ),
      ),
    );
  }
}
