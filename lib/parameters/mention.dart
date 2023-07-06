import 'package:flutter/material.dart';

class Mention {
  String title;
  String content;

  Mention(this.title, this.content);
}

class MentionScreen extends StatelessWidget {
  static final List<Mention> mentions = [
    Mention(
        "Informations générales",
        "Cette mention légale régit votre utilisation de l'application fauna-scan"
            "à partir d'un smartphone (ci-après dénommée \"l'Application\") "
            "développée et exploitée par des étudiants de l'ISPM, plus "
            "précisément un groupe de projet d'étudiant en M1. Toute référence "
            "à \"nous\", \"notre\" ou \"nos\" désigne fauna-scan company."),
    Mention(
        "Propriété intellectuelle",
        "Tous les droits de propriété intellectuelle relatifs à l'Application, "
            "y compris mais sans s'y limiter, les droits d'auteur, les marques "
            "commerciales et les brevets, sont la propriété exclusive "
            "de fauna-scan company. Vous ne pouvez pas utiliser, reproduire, "
            "distribuer ou modifier l'Application ou son contenu sans autorisation "
            "préalable écrite de notre part."),
    Mention(
        "Limitation de responsabilité",
        "Nous nous efforçons de fournir une application fiable et de qualité, "
            "mais nous ne pouvons pas garantir l'exactitude, l'exhaustivité ou "
            "la pertinence des informations fournies par l'Application. Vous "
            "reconnaissez et acceptez que l'utilisation de l'Application se "
            "fait à vos propres risques et que nous déclinons toute responsabilité "
            "en cas de préjudice, de perte ou de dommage résultant de votre "
            "utilisation de l'Application."),
    Mention(
        "Collecte de données",
        "Lors de votre utilisation de l'Application, certaines données peuvent "
            "être collectées conformément à notre politique de confidentialité. "
            "Ces données peuvent inclure des informations sur votre appareil, "
            "votre emplacement géographique et votre utilisation de l'Application. "
            "En utilisant l'Application, vous consentez à la collecte, au traitement "
            "et à l'utilisation de vos données conformément à notre politique de "
            "confidentialité."),
    Mention(
        "Liens vers des sites tiers",
        "L'Application peut contenir des liens vers des sites web ou des services "
            "tiers. Nous ne contrôlons pas ces sites tiers et déclinons toute "
            "responsabilité quant à leur contenu, leur exactitude ou leur disponibilité. "
            "L'accès et l'utilisation de ces sites tiers se font à vos propres risques."),
  ];

  const MentionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              //Icons.safety_check,
              Icons.safety_divider,
              size: 27,
            ),
          ),
          const Text("Mentions légale")
        ]),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: mentions.length,
          itemBuilder: (context, index) {
            Mention mention = mentions[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: mentionItem(mention, index),
            );
          }),
    );
  }
}

Widget mentionItem(mention, order) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text((order + 1).toString() + " " + mention.title,
              style: const TextStyle(
                fontSize: 18,
              )),
        ),
        Text(mention.content,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey[700]),
            softWrap: true)
      ],
    ),
  );
}
