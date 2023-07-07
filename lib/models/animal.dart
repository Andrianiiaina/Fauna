class Animal {
  dynamic id;
  String nom;
  String regime;
  bool estVertebre;
  String zones;
  String image;
  int espece;
  int classe;
  dynamic caracteristique;
  int famille;
  dynamic texture;
  int genre;
  Animal({
    this.id,
    required this.nom,
    required this.regime,
    required this.estVertebre,
    required this.zones,
    required this.image,
    required this.classe,
    this.caracteristique,
    required this.famille,
    required this.genre,
    required this.espece,
    this.texture,
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
        nom: "Caméléon panthère",
        regime: "Carnivore",
        zones: "Présent dans tout Madagascar",
        estVertebre: true,
        image: "assets/reptiles/cameleon_panthere.jpg",
        classe: 1,
        famille: 0,
        genre: 0,
        espece: 0),
    Animal(
        nom: "Caméléon nain",
        regime: "Carnivore",
        zones: "Principalement dans les forêts de l'est de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/cameleon_nain.jpg",
        classe: 1,
        famille: 0,
        genre: 1,
        espece: 1),
    Animal(
        nom: "Crocodile du Nil",
        regime: "Carnivore",
        zones:
            "Présent dans certaines régions côtières et fluviales de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/crocodile_nil.jpg",
        classe: 1,
        famille: 1,
        genre: 2,
        espece: 2),
    Animal(
        nom: "Geckos à queue plate",
        regime: "Carnivore",
        zones: "Répartis dans différentes régions de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/gecko_queue_plate.jpg",
        classe: 1,
        famille: 2,
        genre: 3,
        espece: 3),
    Animal(
        nom: "Serpent-lézard",
        regime: "Omnivore",
        zones: "Présent dans les forêts sèches du sud de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/serpent_lezard.jpg",
        classe: 1,
        famille: 3,
        genre: 4,
        espece: 4),
    Animal(
        nom: "Tortue radiée",
        regime: "Herbivore",
        zones: "Endémique du sud et du sud-ouest de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/tortue_radiée.jpg",
        classe: 1,
        famille: 4,
        genre: 5,
        espece: 5),
    Animal(
        nom: "Boa de Madagascar",
        regime: "Carnivore",
        zones: "Principalement dans les forêts de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/boa_madagascar.jpg",
        classe: 1,
        famille: 5,
        genre: 6,
        espece: 6),
    Animal(
        nom: "Caméléon de Parson",
        regime: "Carnivore",
        zones: "Présent dans les forêts humides du nord-est de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/cameleon_parson.jpg",
        classe: 1,
        famille: 0,
        genre: 7,
        espece: 7),
    Animal(
        nom: "Serpent à tête de vipère",
        regime: "Carnivore",
        zones:
            "Trouvé dans certaines régions de Madagascar, notamment dans les zones forestières",
        estVertebre: true,
        image: "assets/reptiles/serpent_tete_vipere.jpg",
        classe: 1,
        famille: 6,
        genre: 8,
        espece: 8),
    Animal(
        nom: "Gecko diurne à queue plate",
        regime: "Omnivore",
        zones: "Présent dans différentes régions de Madagascar",
        estVertebre: true,
        image: "assets/reptiles/gecko_diurne_queue_plate.jpg",
        classe: 1,
        famille: 2,
        genre: 9,
        espece: 9),

    //oiseaux
    Animal(
        nom: "Mesite varié",
        regime: "Omnivore",
        zones: "Principalement dans les forêts de Madagascar",
        estVertebre: true,
        image: "assets/oiseaux/mesite_varie.jpg",
        classe: 2,
        famille: 0,
        genre: 0,
        espece: 0),
    Animal(
        nom: "Sylvielle délicate",
        regime: "Omnivore",
        zones: "Présent dans différentes régions de Madagascar",
        estVertebre: true,
        image: "assets/oiseaux/sylvielle_delicate.jpg",
        classe: 2,
        famille: 1,
        genre: 1,
        espece: 1),
    Animal(
        nom: "Coua bleu",
        regime: "Herbivore",
        zones: "Endémique de Madagascar",
        estVertebre: true,
        image: "assets/oiseaux/coua_bleu.jpg",
        classe: 2,
        famille: 2,
        genre: 2,
        espece: 2),
    Animal(
        nom: "Busard d'Henst",
        regime: "Carnivore",
        zones: "Présent à Madagascar",
        estVertebre: true,
        image: "assets/oiseaux/busard_henst.jpg",
        classe: 2,
        famille: 3,
        genre: 3,
        espece: 3),
    Animal(
        nom: "Effraie de Soumagne",
        regime: "Carnivore",
        zones: "Endémique de Madagascar",
        estVertebre: true,
        image: "assets/oiseaux/effraie_soumagne.jpg",
        classe: 2,
        famille: 4,
        genre: 4,
        espece: 4),
    Animal(
        nom: "Pigeon rose",
        regime: "Herbsivore",
        zones: "Principalement dans les forêts de Madagascar",
        estVertebre: true,
        image: "assets/oiseaux/pigeon_rose.jpg",
        classe: 2,
        famille: 5,
        genre: 5,
        espece: 5),
    //insectes

    Animal(
        nom: "Papillon bleu de Madagascar",
        regime: "Herbivore",
        zones: "Principalement dans les forêts tropicales de Madagascar",
        estVertebre: false,
        image: "assets/insectes/papillon_bleu.jpg",
        classe: 6,
        famille: 0,
        genre: 0,
        espece: 0),
    Animal(
        nom: "Charançon girafe",
        regime: "Herbivore",
        zones: "Vit dans les arbres à Madagascar",
        estVertebre: false,
        image: "assets/insectes/charancon_girafe.jpg",
        classe: 6,
        famille: 1,
        genre: 1,
        espece: 1),
    Animal(
        nom: "Mante religieuse",
        regime: "Carnivore",
        zones: "Présente à Madagascar",
        estVertebre: false,
        image: "assets/insectes/mante_religieuse.jpg",
        classe: 6,
        famille: 2,
        genre: 2,
        espece: 2),
    Animal(
        nom: "Papillon soyeux de Madagascar",
        regime: "Herbivore",
        zones: "Présent sur l'île",
        estVertebre: false,
        image: "assets/insectes/papillon_soyeux.jpg",
        classe: 6,
        famille: 3,
        genre: 3,
        espece: 3),
  ];
}
