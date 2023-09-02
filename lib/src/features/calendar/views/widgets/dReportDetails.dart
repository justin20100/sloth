import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sloth/src/features/calendar/views/widgets/detailsSlider.dart';
import 'package:sloth/src/kdatas/constants.dart';

class DReportDetails extends StatelessWidget {

  Map eventDetails;
  DReportDetails({Key? key, required this.eventDetails}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Title
        const SizedBox(height: kBigVerticalSpacer,),
        const Center(child: Text('Rapport quotidien' , style: kEventDetailsTitleTextStyle,)),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Center(child: Text(DateFormat.MMMMd(Localizations.localeOf(context).toString()).format(eventDetails['date']), style: kEventDetailsDateTextStyle),),
        const SizedBox(height: kBigVerticalSpacer,),

        Text('Heure de lever', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(eventDetails['results']['wakeUp'].toDate()), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Heure de Couché', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(eventDetails['results']['sleep'].toDate()), style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Evaluation de votre sommeil', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        DetailsSlider(data: eventDetails['results']['sleepEvaluation']),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Evaluation du votre niveau de fatigue cognitive', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        DetailsSlider(data: eventDetails['results']['cognitiveEvaluation']),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Evaluation du votre niveau de fatigue physique', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        DetailsSlider(data: eventDetails['results']['physiqueEvaluation']),
        const SizedBox(height: kNormalVerticalSpacer,),

        Text('Informations supplémentaires sur votre journée', style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        eventDetails['results']['moreInfos']!='' ? Text(eventDetails['results']['moreInfos'], style: k16BasicTextStyle): Text("Vous n'avez pas donné d'informations suplémentaires", style: k16BasicTextStyle),
        const SizedBox(height: kNormalVerticalSpacer,),


        Text("Dans l'ensemble vous vous sentez pour ce jour", style: kLabelGreenText),
        const SizedBox(height: kMicroVerticalSpacer*2,),
        Text("Motivé à ${(eventDetails['results']['motivation'])}%", style: k16BasicTextStyle,),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("Euphorique à ${(eventDetails['results']['euphoria'])}%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("Frais (épuisement) à ${(eventDetails['results']['state'])}%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("Amicale et facile à ${(eventDetails['results']['mood'])}%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("Relaxé à ${(eventDetails['results']['stress'])}%", style: k16BasicTextStyle),
        const SizedBox(height: kMicroVerticalSpacer,),
        Text("Calme à ${(eventDetails['results']['anxiety'])}%", style: k16BasicTextStyle),

        const SizedBox(height: kBigVerticalSpacer,),
      ],
    );
  }
}
