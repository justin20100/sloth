import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataUsage extends StatelessWidget {
  const DataUsage({Key? key}) : super(key: key);

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
        leading: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kColorGreen,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.dataUsage__title,
          style: kAppBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(
            left: kNormalHorizontalSpacer,
            right: kNormalHorizontalSpacer),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kBigVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h1, style: kh2BasicTextStyle,),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p1, style: k16BasicTextStyle,),
                const SizedBox(height: kSmallVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h2,style: kh2BasicTextStyle,),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p2,style: k16BasicTextStyle,),
                const SizedBox(height: kSmallVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h3,style: kh2BasicTextStyle),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p3,style: k16BasicTextStyle,),
                const SizedBox(height: kSmallVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h4,style: kh2BasicTextStyle),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p4,style: k16BasicTextStyle,),
                const SizedBox(height: kSmallVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h5,style: kh2BasicTextStyle),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p5,style: k16BasicTextStyle,),
                const SizedBox(height: kSmallVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h6,style: kh2BasicTextStyle),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p6,style: k16BasicTextStyle,),
                const SizedBox(height: kSmallVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__h7,style: kh2BasicTextStyle),
                const SizedBox(height: kMicroVerticalSpacer,),
                Text(AppLocalizations.of(context)!.dataUsage__p7,style: k16BasicTextStyle,),
                const SizedBox(height: kNormalVerticalSpacer,),
              ],
            ),
      )),
    );
  }
}
