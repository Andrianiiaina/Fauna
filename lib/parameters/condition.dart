import 'package:flutter/material.dart';

class Condition {
  String title;
  String content;

  Condition(this.title, this.content);
}

class ConditionScreen extends StatelessWidget {
  static final List<Condition> conditions = [
    Condition(
        "Acceptation des conditions d'utilisation",
        "En téléchargeant, installant ou utilisant cette application de scan "
            "d'animal à partir d'un smartphone (ci-après dénommée \"l'Application\"), "
            "vous acceptez pleinement et sans réserve les présentes conditions "
            "d'utilisation. Si vous n'acceptez pas ces conditions, veuillez ne "
            "pas utiliser l'Application."),
    Condition(
        "Utilisation de l'Application",
        "L'Application est conçue pour permettre aux utilisateurs de scanner des "
            "animaux à partir de leur smartphone afin d'obtenir des informations "
            "supplémentaires sur ceux-ci. Vous acceptez d'utiliser l'Application "
            "conformément aux lois et réglementations en vigueur et de respecter "
            "les droits des autres utilisateurs."),
    Condition(
        "Propriété intellectuelle",
        "L'Application et son contenu, y compris mais sans s'y limiter, les textes,"
            " les graphiques, les images, les logos, les icônes et les éléments "
            "audiovisuels, sont la propriété exclusive de la société responsable "
            "de l'Application ou de ses concédants de licence. Vous vous engagez "
            "à ne pas copier, reproduire, distribuer, modifier, afficher publiquement "
            "ou exploiter de quelque manière que ce soit le contenu de l'Application "
            "sans autorisation préalable écrite."),
    Condition(
        "Collecte de données",
        "Lors de l'utilisation de l'Application, certaines données concernant votre "
            "appareil et votre utilisation peuvent être collectées à des fins "
            "d'amélioration de l'expérience utilisateur et de fourniture de services "
            "personnalisés. En utilisant l'Application, vous consentez à la collecte, "
            "au traitement et à l'utilisation de ces données conformément à notre "
            "politique de confidentialité."),
    Condition(
        "Responsabilité",
        "L'utilisation de l'Application se fait à vos propres risques. Nous nous "
            "efforçons de fournir des informations précises et à jour, mais nous "
            "ne pouvons pas garantir l'exactitude, l'exhaustivité ou la pertinence "
            "des informations fournies par l'Application. Nous déclinons toute "
            "responsabilité en cas de préjudice, de perte ou de dommage résultant "
            "de l'utilisation de l'Application."),
    Condition(
        "Modifications des conditions d'utilisation",
        "Nous nous réservons le droit de modifier ces conditions d'utilisation à "
            "tout moment. Les modifications prendront effet dès leur publication "
            "sur l'Application. Il est de votre responsabilité de consulter régulièrement "
            "les conditions d'utilisation afin de vous tenir informé des éventuelles "
            "modifications."),
    Condition(
        "Résiliation",
        "Nous nous réservons le droit de résilier, de suspendre ou de restreindre "
            "votre accès à l'Application, sans préavis ni responsabilité, si nous "
            "estimons que vous avez violé ces conditions d'utilisation ou toute "
            "autre disposition applicable."),
    Condition(
        "Contact",
        "Si vous avez des questions, des préoccupations ou des commentaires "
            "concernant ces conditions d'utilisation, veuillez nous contacter à "
            "l'adresse suivante : fauna-scan-ispm@gmail.com.")
  ];

  const ConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.safety_divider,
              //Icons.safety_check,
              size: 27,
            ),
          ),
          const Text("Condition d'utilisation")
        ]),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: conditions.length,
          itemBuilder: (context, index) {
            Condition condition = conditions[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: conditionItem(condition, index),
            );
          }),
    );
  }
}

Widget conditionItem(Condition condition, int order) {
  return Container(
    margin: const EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text((order + 1).toString() + " " + condition.title,
              style: const TextStyle(
                fontSize: 18,
              )),
        ),
        Text(condition.content,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey[700]),
            softWrap: true)
      ],
    ),
  );
}
