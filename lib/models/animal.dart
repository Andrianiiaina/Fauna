class Animal {
  dynamic id;
  String nom;
  String regime;
  bool estVertebre;
  String zones;
  String image;
  int espece;
  int caracteristique;
  int famille;
  int texture;
  int classe;
  Animal({
    this.id,
    required this.nom,
    required this.regime,
    required this.estVertebre,
    required this.zones,
    required this.image,
    required this.caracteristique,
    required this.famille,
    required this.classe,
    required this.espece,
    required this.texture,
  });

  Animal.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nom = res["nom"],
        regime = res["regime"],
        zones = res["zones"],
        estVertebre = res["estVertebre"] == 1,
        image = res["image"],
        caracteristique = res["caracteristique"],
        famille = res["famille"],
        classe = res["classe"],
        espece = res["espece"],
        texture = res["texture"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nom': nom,
      'regime': regime,
      'zones': zones,
      'estVertebre': estVertebre == true ? 1 : 0,
      'image': image,
      'caracteristique': caracteristique,
      'famille': famille,
      'classe': classe,
      'espece': espece,
      'texture': texture,
    };
  }
}
