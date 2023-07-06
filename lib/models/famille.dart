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
    Famille(nomFam: "Felidae", descriptionFam: "descriptionFama"),
    Famille(nomFam: "Nymphalidae", descriptionFam: "descriptionFamb"),
    Famille(nomFam: "ca", descriptionFam: "descriptionFamc"),
    Famille(nomFam: "da", descriptionFam: "descriptionFamd"),
  ];
}
