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
}
