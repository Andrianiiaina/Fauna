class Classe {
  dynamic idCls;
  String nomCls;
  String descriptionCls;
  Classe({this.idCls, required this.nomCls, required this.descriptionCls});

  Classe.fromMap(Map<String, dynamic> res)
      : idCls = res["idCls"],
        nomCls = res["nomCls"],
        descriptionCls = res["descriptionCls"];

  Map<String, Object?> toMap() {
    return {
      'idCls': idCls,
      'nomCls': nomCls,
      'descriptionCls': descriptionCls,
    };
  }

  static List<Classe> classes = [
    Classe(
        idCls: 1,
        nomCls: 'Insectes',
        descriptionCls: "Queleques description à foutre"),
    Classe(
        idCls: 3,
        nomCls: 'Reptiles',
        descriptionCls: "Queleques description à foutre"),
    Classe(
        idCls: 2,
        nomCls: 'Oiseaux',
        descriptionCls: "Queleques description à foutre"),
    Classe(
        idCls: 0,
        nomCls: 'Mammiferes',
        descriptionCls: "Queleques description à foutre"),
  ];
}
