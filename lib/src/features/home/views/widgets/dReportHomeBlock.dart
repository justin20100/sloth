import 'package:flutter/material.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/snackbars/error_snackbar.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class DReportHomeBlock extends StatefulWidget {
  const DReportHomeBlock({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<DReportHomeBlock> createState() => _DReportHomeBlockState();
}

class _DReportHomeBlockState extends State<DReportHomeBlock> {
  Tools tools = Tools();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                widget.text,
                style: kHomeBoxesTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kMicroVerticalSpacer * 3,
              ),
              Center(
                    child: WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.bounce(
                          duration: const Duration(milliseconds: 1500),
                          effectStrength: 0.4
                      ),
                      child:Button(
                        label: AppLocalizations.of(context)!.home__boxDRepportButton,
                        onPressed: () async {
                          bool internetConnected = await tools.checkInternetConnection();
                          if(internetConnected){
                            Navigator.pushNamed(context, kDReportRoute);
                          }else{
                            ErrorSnackbar.show(context, AppLocalizations.of(context)!.home__boxDRepportInternetError);
                          }
                        },
                      ),
                )
              ),
            ],
          ),
        );
  }
}
