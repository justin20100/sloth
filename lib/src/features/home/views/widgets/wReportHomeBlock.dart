import 'package:flutter/material.dart';
import 'package:sloth/src/features/home/controllers/homeController.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:sloth/src/utils/functions.dart';
import 'package:sloth/src/widgets/button.dart';
import 'package:sloth/src/widgets/snackbars/errorSnackbar.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WReportHomeBlock extends StatefulWidget {
   WReportHomeBlock({Key? key}) : super(key: key);



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
                child:Button(
                  label: AppLocalizations.of(context)!.home__boxWRepportButton,
                  onPressed: () async {
                    bool internetConnected = await checkInternetConnection();
                    if(internetConnected){
                      homeController.calculateWReport();
                    }else{
                      ErrorSnackbar.show(context, AppLocalizations.of(context)!.home__boxDRepportInternetError);
                    }
                  },
                ),)
          ),
        ],
      ),
    );
  }
}
