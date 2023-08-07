import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';

class DayRepportHomeBlock extends StatefulWidget {
  DayRepportHomeBlock({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<DayRepportHomeBlock> createState() => _DayRepportHomeBlockState();
}

class _DayRepportHomeBlockState extends State<DayRepportHomeBlock> {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (Timer t) {
      springController.play();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Spring.shake(
        springController: springController,
        animDuration: const Duration(milliseconds: 450),
        child: Container(
          decoration: kHomeBoxDecoration,
          padding: const EdgeInsets.only(
              top: kNormalVerticalSpacer,
              right: kNormalHorizontalSpacer,
              bottom: kNormalVerticalSpacer,
              left: kNormalHorizontalSpacer),
          child: Column(
            children: [
              Text(
                widget.text,
                style: kHomeBoxesTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kMicroVerticalSpacer * 3,
              ),
              Center(
                child: Button(
                  label: 'Remplir',
                  onPressed: () {
                    Navigator.pushNamed(context, kDReportRoute);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
