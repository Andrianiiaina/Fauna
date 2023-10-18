class Bibliotheque {
  dynamic idBiblio;
  String nomAnimal;
  String imageAnimal;
  String descriptionAnimal;
  Bibliotheque(
      {this.idBiblio,
      required this.nomAnimal,
      required this.imageAnimal,
      required this.descriptionAnimal});

  Bibliotheque.fromMap(Map<String, dynamic> res)
      : idBiblio = res["idBiblio"],
        nomAnimal = res["nomAnimal"],
        imageAnimal = res["imageAnimal"],
        descriptionAnimal = res["descriptionAnimal"];

  Map<String, Object?> toMap() {
    return {
      'idBiblio': idBiblio,
      'nomAnimal': nomAnimal,
      'imageAnimal': imageAnimal,
      'descriptionAnimal': descriptionAnimal,
    };
  }
}
