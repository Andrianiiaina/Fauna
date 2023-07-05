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

  static List<Animal> listOfAnimals = [
    Animal(
        id: 2,
        nom: "Fosa",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        espece: 1,
        texture: 1),
    Animal(
        id: 0,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 2,
        espece: 2,
        texture: 2),
    Animal(
        id: 1,
        nom: "Fosa",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        espece: 1,
        texture: 1),
    Animal(
        id: 3,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 2,
        espece: 2,
        texture: 2),
    Animal(
        id: 5,
        nom: "Fosa",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        espece: 1,
        texture: 1),
    Animal(
        id: 6,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 2,
        espece: 2,
        texture: 2),
  ];
}
