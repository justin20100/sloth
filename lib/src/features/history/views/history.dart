import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:sloth/src/routing/routes.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorCream,
      appBar: AppBar(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: kColorCream,
        leading: WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
          child: GestureDetector(
            onTap: () => {Navigator.popAndPushNamed(context, kHomeRoute)},
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kColorGreen,
            ),
          ),
        ),
        title: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(curve: Curves.easeOutCirc, duration: const Duration(milliseconds: 700)),
            child: Text(
              AppLocalizations.of(context)!.history__title,
              style: kAppBarTextStyle,
            ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: kNormalHorizontalSpacer, right: kNormalHorizontalSpacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kNormalVerticalSpacer),
            ],
          ),
        ),
      ),
    );
  }
}
