class Animal {
  dynamic id;
  String nom;
  String regime;
  bool estVertebre;
  String zones;
  String image;
  int espece;
  int classe;
  int caracteristique;
  int famille;
  int texture;
  int genre;
  Animal({
    this.id,
    required this.nom,
    required this.regime,
    required this.estVertebre,
    required this.zones,
    required this.image,
    required this.classe,
    required this.caracteristique,
    required this.famille,
    required this.genre,
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
        genre = res["genre"],
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
      'genre': genre,
      'espece': espece,
      'texture': texture,
    };
  }

  static List<Animal> listOfAnimals = [
    Animal(
        // id: 2,
        nom: "Fossa Dia",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        genre: 1,
        espece: 1,
        texture: 1),
    Animal(
        // id: 4,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        genre: 2,
        espece: 2,
        texture: 2),
    Animal(
        // id: 1,
        nom: "Fossa Dia",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        classe: 1,
        famille: 1,
        genre: 1,
        espece: 1,
        texture: 1),
    Animal(
        //id: 3,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        genre: 2,
        espece: 2,
        texture: 2),
    Animal(
        //  id: 6,
        nom: "Fossa Dia",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        famille: 1,
        classe: 1,
        genre: 1,
        espece: 1,
        texture: 1),
    Animal(
        // id: 7,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        classe: 1,
        famille: 1,
        genre: 2,
        espece: 2,
        texture: 2),
    Animal(
        // id: 5,
        nom: "Fossa Dia",
        regime: "Carnivore",
        zones: "Manakara",
        estVertebre: true,
        image: "assets/insectes/scarabe.jpg",
        caracteristique: 1,
        classe: 1,
        famille: 1,
        genre: 1,
        espece: 1,
        texture: 1),
    Animal(
        //id: 8,
        nom: "Tanalahy",
        regime: "herbivore",
        zones: "Antalaha, vohemar",
        estVertebre: true,
        image: "assets/insectes/urani.jpg",
        caracteristique: 1,
        classe: 1,
        famille: 1,
        genre: 2,
        espece: 2,
        texture: 2),
  ];
}
