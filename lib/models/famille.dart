class Famille {
  dynamic idFam;
  String nomFam;
  String descriptionFam;
  Famille({this.idFam, required this.nomFam, required this.descriptionFam});

  Famille.fromMap(Map<String, dynamic> res)
      : idFam = res["idFam"],
        nomFam = res["nomFam"],
        descriptionFam = res["descriptionFam"];

  Map<String, Object?> toMap() {
    return {
      'idFam': idFam,
      'nomFam': nomFam,
      'descriptionFam': descriptionFam,
    };
  }

  static List<Famille> listOfFamilles = [
    Famille(
        nomFam: "Chamaeleonidae",
        descriptionFam: "Caméléon panthère, Caméléon nain, Caméléon de Parson"),
    Famille(nomFam: "Crocodylidae", descriptionFam: "Crocodile du Nil"),
    Famille(
        nomFam: "Gekkonidae",
        descriptionFam: "Geckos à queue plate, Gecko diurne à queue plate"),
    Famille(nomFam: "Gerrhosauridae", descriptionFam: "Serpent-lézard"),
    Famille(nomFam: "Testudinidae", descriptionFam: "Tortue radiée"),
    Famille(nomFam: "Boidae", descriptionFam: "Boa de Madagascar"),
    Famille(
        nomFam: "Lamprophiidae", descriptionFam: "Serpent à tête de vipère"),
    //oiseaux
    Famille(nomFam: "Mesitornithidae", descriptionFam: "Mesites"),
    Famille(nomFam: "Cisticolidae", descriptionFam: "Cisticolidés"),
    Famille(nomFam: "Cuculidae", descriptionFam: "Couas"),
    Famille(nomFam: "Accipitridae", descriptionFam: "Accipitridés"),
    Famille(nomFam: "Tytonidae", descriptionFam: "Effraies"),
    Famille(nomFam: "Columbidae", descriptionFam: "Pigeons"),
    //insectes
    Famille(nomFam: "Papilionidae", descriptionFam: "Papilionidés"),
    Famille(nomFam: "Curculionidae", descriptionFam: "Charançons"),
    Famille(nomFam: "Mantidae", descriptionFam: "Mantes"),
    Famille(nomFam: "Saturniidae", descriptionFam: "Saturniidés")
  ];
}
