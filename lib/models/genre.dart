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
    Genre(nomGenre: 'Canis', descriptionGenre: "descriptionGenre"),
    Genre(nomGenre: 'Morpho', descriptionGenre: "descriptionGenre"),
    Genre(nomGenre: 'Panthera', descriptionGenre: "descriptionGenre"),
  ];
}
