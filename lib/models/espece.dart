class Espece {
  dynamic idEsp;
  String nomEsp;
  String descriptionEsp;
  Espece({this.idEsp, required this.nomEsp, required this.descriptionEsp});

  Espece.fromMap(Map<String, dynamic> res)
      : idEsp = res["idEsp"],
        nomEsp = res["nomEsp"],
        descriptionEsp = res["descriptionEsp"];

  Map<String, Object?> toMap() {
    return {
      'idEsp': idEsp,
      'nomEsp': nomEsp,
      'descriptionEsp': descriptionEsp,
    };
  }

  static List<Espece> especes = [
    Espece(nomEsp: 'Lupus', descriptionEsp: "descriptionEsp"),
    Espece(nomEsp: 'Canis', descriptionEsp: "descriptionEsp"),
    Espece(nomEsp: 'Homo', descriptionEsp: "descriptionEsp"),
  ];
}
