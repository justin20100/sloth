import 'package:flutter/material.dart';

import '../../styles/constants.dart';

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
        title: const Text(
          "Confidentialité",
          style: kAppBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(
            left: kNormalHorizontalSpacer,
            right: kNormalHorizontalSpacer),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kBigVerticalSpacer,),
                Text('Politique de confidentialité', style: kh2BasicTextStyle,),
                SizedBox(height: kMicroVerticalSpacer,),
                Text('Chez Sloth, nous accordons une grande importance à la confidentialité et à la sécurité des données de nos utilisateurs. Cette politique de confidentialité explique comment nous collectons, utilisons, stockons et protégeons les informations que vous nous fournissez lorsque vous utilisez notre application.', style: k16BasicTextStyle,),
                SizedBox(height: kSmallVerticalSpacer,),
                Text('Collecte et utilisation des informations',style: kh2BasicTextStyle,),
                SizedBox(height: kMicroVerticalSpacer,),
                Text("Lorsque vous utilisez notre application, nous pouvons collecter certaines informations personnelles vous concernant, telles que votre nom, votre adresse e-mail et d'autres informations que vous choisissez de nous fournir. Ces informations sont nécessaires pour vous offrir une expérience personnalisée et répondre à vos besoins spécifiques.",style: k16BasicTextStyle,),
                SizedBox(height: kSmallVerticalSpacer,),
                Text("Sécurité des données",style: kh2BasicTextStyle),
                SizedBox(height: kMicroVerticalSpacer,),
                Text("Nous comprenons l'importance de la sécurité des données et nous nous engageons à protéger vos informations personnelles. Nous utilisons des mesures de sécurité techniques et organisationnelles appropriées pour prévenir tout accès non autorisé, toute divulgation, toute altération ou toute destruction de vos données.",style: k16BasicTextStyle,),
                SizedBox(height: kSmallVerticalSpacer,),
                Text("Stockage des données",style: kh2BasicTextStyle),
                SizedBox(height: kMicroVerticalSpacer,),
                Text("Nous utilisons Firebase, une plateforme d'hébergement et de base de données sécurisée, pour stocker et gérer les données de notre application. Firebase offre des fonctionnalités avancées de sécurité et de confidentialité, y compris le chiffrement des données en transit et au repos. Nous nous engageons à utiliser les fonctionnalités de sécurité de Firebase pour protéger vos informations personnelles.",style: k16BasicTextStyle,),
                SizedBox(height: kSmallVerticalSpacer,),
                Text("Partage des informations",style: kh2BasicTextStyle),
                SizedBox(height: kMicroVerticalSpacer,),
                Text("Nous ne vendons, ne louons ni ne partageons vos informations personnelles avec des tiers, sauf si cela est nécessaire pour vous fournir nos services ou si nous sommes légalement tenus de le faire. Nous ne partageons vos informations qu'avec votre consentement explicite ou conformément aux lois applicables sur la confidentialité des données.",style: k16BasicTextStyle,),
                SizedBox(height: kSmallVerticalSpacer,),
                Text("Vos droits",style: kh2BasicTextStyle),
                SizedBox(height: kMicroVerticalSpacer,),
                Text("Vous avez le droit d'accéder à vos informations personnelles, de les corriger, de les mettre à jour ou de les supprimer. Si vous souhaitez exercer ces droits ou si vous avez des questions concernant notre politique de confidentialité, veuillez nous contacter à l'adresse suivante : dev@justin-vincent.be.",style: k16BasicTextStyle,),
                SizedBox(height: kSmallVerticalSpacer,),
                Text("Modifications de la politique de confidentialité",style: kh2BasicTextStyle),
                SizedBox(height: kMicroVerticalSpacer,),
                Text("Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Toute modification sera publiée sur cette page et sera effective dès sa publication. Un mail de prévention vous sera envoyé si modifications il y a.",style: k16BasicTextStyle,),
                SizedBox(height: kNormalVerticalSpacer,),
              ],
            ),
      )),
    );
  }
}
