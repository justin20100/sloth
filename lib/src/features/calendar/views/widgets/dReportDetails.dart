import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sloth/src/kdatas/constants.dart';

class DReportDetails extends StatelessWidget {

  Map eventDetails;
  DReportDetails({Key? key, required this.eventDetails}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Title
        const SizedBox(height: kSmallVerticalSpacer,),
        const Center(child: Text('Rapport quotidien' , style: kEventDetailsTitleTextStyle,)),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Center(child: Text(DateFormat.MMMMd(Localizations.localeOf(context).toString()).format(eventDetails['date']), style: k16BasicTextStyle),),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Heure de lever', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(eventDetails['results']['wakeUp'].toDate()), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Heure de Couché', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(eventDetails['results']['sleep'].toDate()), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Evaluation de votre sommeil', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text(eventDetails['results']['sleepEvaluation'].toString(), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Evaluation du votre niveau de fatigue cognitive', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text(eventDetails['results']['cognitiveEvaluation'].toString(), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Evaluation du votre niveau de fatigue physique', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text(eventDetails['results']['physiqueEvaluation'].toString(), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Informations supplémentaires sur votre journée', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        eventDetails['results']['moreInfos']!='' ? Text(eventDetails['results']['moreInfos'], style: k16BasicTextStyle): Text("Pas d'infomations supplémentaires", style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),


        Text("Dans l'ensemble vous vous sentez", style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text("motivé à "+(eventDetails['results']['motivation']*10).toInt().toString()+"%", style: k16BasicTextStyle,),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("motivé à "+(eventDetails['results']['euphoria']*10).toInt().toString()+"%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("motivé à "+(eventDetails['results']['state']*10).toInt().toString()+"%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("motivé à "+(eventDetails['results']['mood']*10).toInt().toString()+"%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("motivé à "+(eventDetails['results']['stress']*10).toInt().toString()+"%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("motivé à "+(eventDetails['results']['anxiety']*10).toInt().toString()+"%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),

      ],
    );
  }
}
