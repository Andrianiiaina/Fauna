class Genre {
  dynamic idGenre;
  String nomGenre;
  String descriptionGenre;
  Genre({this.idGenre, required this.nomGenre, required this.descriptionGenre});

  Genre.fromMap(Map<String, dynamic> res)
      : idGenre = res["idGenre"],
        nomGenre = res["nomGenre"],
        descriptionGenre = res["descriptionGenre"];

  Map<String, Object?> toMap() {
    return {
      'idGenre': idGenre,
      'nomGenre': nomGenre,
      'descriptionGenre': descriptionGenre,
    };
  }

  static List<Genre> genres = [
    Genre(nomGenre: "Furcifer", descriptionGenre: "Caméléon panthère"),
    Genre(nomGenre: "Brookesia", descriptionGenre: "Caméléon nain"),
    Genre(nomGenre: "Crocodylus", descriptionGenre: "Crocodile du Nil"),
    Genre(nomGenre: "Uroplatus", descriptionGenre: "Geckos à queue plate"),
    Genre(nomGenre: "Langaha", descriptionGenre: "Serpent-lézard"),
    Genre(nomGenre: "Astrochelys", descriptionGenre: "Tortue radiée"),
    Genre(nomGenre: "Sanzinia", descriptionGenre: "Boa de Madagascar"),
    Genre(nomGenre: "Calumma", descriptionGenre: "Caméléon de Parson"),
    Genre(
        nomGenre: "Atractaspis", descriptionGenre: "Serpent à tête de vipère"),
    Genre(nomGenre: "Phelsuma", descriptionGenre: "Gecko diurne à queue plate"),
    /**oiseaux */
    Genre(nomGenre: "Mesitornis", descriptionGenre: "Genre des Mesites"),
    Genre(nomGenre: "Neomixis", descriptionGenre: "Genre des Sylvielles"),
    Genre(nomGenre: "Coua", descriptionGenre: "Genre des Couas"),
    Genre(
        nomGenre: "Eutriorchis", descriptionGenre: "Genre des Busards d'Henst"),
    Genre(nomGenre: "Tyto", descriptionGenre: "Genre des Effraies"),
    Genre(nomGenre: "Alectroenas", descriptionGenre: "Genre des Pigeons roses"),
    //insectes

    Genre(
        nomGenre: "Aponogeton",
        descriptionGenre: "Genre des papillons bleus de Madagascar"),
    Genre(
        nomGenre: "Trachelophorus",
        descriptionGenre: "Genre des charançons girafe"),
    Genre(nomGenre: "Mantis", descriptionGenre: "Genre des mantes religieuses"),
    Genre(
        nomGenre: "Saturniidae",
        descriptionGenre: "Genre des papillons soyeux de Madagascar")
  ];
  static List<Genre> genre = [
    Genre(nomGenre: 'Canis', descriptionGenre: "descriptionGenre"),
    Genre(nomGenre: 'Morpho', descriptionGenre: "descriptionGenre"),
    Genre(nomGenre: 'Panthera', descriptionGenre: "descriptionGenre"),
  ];
}
