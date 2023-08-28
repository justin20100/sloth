import 'package:flutter/material.dart';
import 'package:sloth/src/features/home/controllers/homeController.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WReportHomeBlock extends StatefulWidget {
  const WReportHomeBlock({Key? key, required this.onPressed}) : super(key: key);


  final VoidCallback onPressed;
  @override
  State<WReportHomeBlock> createState() => _WReportHomeBlockState();

}

class _WReportHomeBlockState extends State<WReportHomeBlock> {
  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kHomeDRepportBoxDecoration,
      padding: const EdgeInsets.only(
          top: kNormalVerticalSpacer,
          right: kNormalHorizontalSpacer,
          bottom: kNormalVerticalSpacer,
          left: kNormalHorizontalSpacer),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.home__boxWRepport,
            style: kHomeBoxesTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: kMicroVerticalSpacer * 3,
          ),
          Center(
              child: WidgetAnimator(
                atRestEffect: WidgetRestingEffects.bounce(
                    delay: const Duration(milliseconds: 2000),
                    duration: const Duration(milliseconds: 1500),
                    effectStrength: 0.4
                ),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: kColorGreen,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 15, right: 15),
                          textStyle: kButtonTextStyle,
                        ),
                        onPressed: widget.onPressed,
                        child: Text(AppLocalizations.of(context)!.home__boxWRepportButton),
                      ),
                    ],
                  ),
                ))
          ),
        ],
      ),
    );
  }
}
