class Bibliotheque {
  dynamic idBiblio;
  int idAnimal;
  String date;
  String nomAnimal;
  String imageAnimal;
  String descriptionAnimal;
  Bibliotheque(
      {this.idBiblio,
      required this.nomAnimal,
      required this.imageAnimal,
      required this.descriptionAnimal,
      required this.date,
      required this.idAnimal});

  Bibliotheque.fromMap(Map<String, dynamic> res)
      : idBiblio = res["idBiblio"],
        idAnimal = res["idAnimal"],
        date = res['date'],
        nomAnimal = res["nomAnimal"],
        imageAnimal = res["imageAnimal"],
        descriptionAnimal = res["descriptionAnimal"];

  Map<String, Object?> toMap() {
    return {
      'idBiblio': idBiblio,
      'idAnimal': idAnimal,
      'date': date,
      'nomAnimal': nomAnimal,
      'imageAnimal': imageAnimal,
      'descriptionAnimal': descriptionAnimal,
    };
  }
}
