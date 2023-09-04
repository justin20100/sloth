import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

class RegisterTraitsQuestionCheckboxes extends StatefulWidget {
  String textOption1;
  bool valueOption1;
  ValueChanged<bool?>? onChangeOption1;
  String textOption2;
  bool valueOption2;
  ValueChanged<bool?>? onChangeOption2;
  String textOption3;
  bool valueOption3;
  ValueChanged<bool?>? onChangeOption3;
  String textOption4;
  bool valueOption4;
  ValueChanged<bool?>? onChangeOption4;

  RegisterTraitsQuestionCheckboxes({Key? key, required this.textOption1, required this.valueOption1, this.onChangeOption1, required this.textOption2, required this.valueOption2, this.onChangeOption2, required this.textOption3, required this.valueOption3, this.onChangeOption3, required this.textOption4, required this.valueOption4, this.onChangeOption4}) : super(key: key);


  @override
  State<RegisterTraitsQuestionCheckboxes> createState() => _RegisterTraitsQuestionCheckboxesState();
}

class _RegisterTraitsQuestionCheckboxesState extends State<RegisterTraitsQuestionCheckboxes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75,
          height: 90,
          padding: const EdgeInsets.only(
              left: kSmallHorizontalSpacer,
              top: kMicroVerticalSpacer * 2,
              right: kSmallHorizontalSpacer),
          decoration: kBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Text(widget.textOption1,
                  style: kCheckboxText, softWrap: true),
              const SizedBox(
                height: 10,
              ),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                    activeColor: kColorGreen,
                    checkColor: kColorYellow,
                    side: MaterialStateBorderSide
                        .resolveWith(
                          (states) => const BorderSide(
                          width: 0.8,
                          color: kColorGreen),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    value: widget.valueOption1,
                    onChanged: widget.onChangeOption1),
              )
            ],
          ),
        ),
        Container(
          width: 75,
          height: 90,
          padding: const EdgeInsets.only(
              left: kSmallHorizontalSpacer,
              top: kMicroVerticalSpacer * 2,
              right: kSmallHorizontalSpacer),
          decoration: kBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Text(widget.textOption2,
                  style: kCheckboxText,
                  softWrap: true,
                  textAlign: TextAlign.center),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                    activeColor: kColorGreen,
                    checkColor: kColorYellow,
                    side: MaterialStateBorderSide
                        .resolveWith(
                          (states) => const BorderSide(
                          width: 0.8,
                          color: kColorGreen),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    value: widget.valueOption2,
                    onChanged: widget.onChangeOption2),
              )
            ],
          ),
        ),
        Container(
          width: 75,
          height: 90,
          padding: const EdgeInsets.only(
              left: kSmallHorizontalSpacer,
              top: kMicroVerticalSpacer * 2,
              right: kSmallHorizontalSpacer),
          decoration: kBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Text(widget.textOption3,
                  style: kCheckboxText,
                  softWrap: true,
                  textAlign: TextAlign.center),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                    activeColor: kColorGreen,
                    checkColor: kColorYellow,
                    side: MaterialStateBorderSide
                        .resolveWith(
                          (states) => const BorderSide(
                          width: 0.8,
                          color: kColorGreen),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    value: widget.valueOption3,
                    onChanged: widget.onChangeOption3),
              )
            ],
          ),
        ),
        Container(
          width: 75,
          height: 90,
          padding: const EdgeInsets.only(
              left: kSmallHorizontalSpacer,
              top: kMicroVerticalSpacer * 2,
              right: kSmallHorizontalSpacer),
          decoration: kBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Text(widget.textOption4,
                  style: kCheckboxText,
                  softWrap: true,
                  textAlign: TextAlign.center),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                    activeColor: kColorGreen,
                    checkColor: kColorYellow,
                    side: MaterialStateBorderSide
                        .resolveWith(
                          (states) => const BorderSide(
                          width: 0.8,
                          color: kColorGreen),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(4),
                    ),
                    value: widget.valueOption4,
                    onChanged: widget.onChangeOption4),
              )
            ],
          ),
        )
      ],
    );
  }
}
