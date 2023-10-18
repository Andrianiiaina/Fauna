class Animal {
  dynamic id;
  String nom;
  String regime;
  bool estVertebre;
  String zones;
  String image;
  String espece;
  int classe;
  String description;
  int famille;
  String info;
  int genre;
  Animal({
    this.id,
    required this.nom,
    required this.regime,
    required this.estVertebre,
    required this.zones,
    required this.image,
    required this.classe,
    required this.description,
    required this.famille,
    required this.genre,
    required this.espece,
    required this.info,
  });
  static getLink(String imagesString) {
    String text = imagesString.substring(1, imagesString.length - 1);
    List<String> images = text.split(',');

    return images;
  }

  Animal.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        nom = res["nom"],
        regime = res["regime"],
        zones = res["zones"],
        estVertebre = res["estVertebre"] == 1,
        image = res["image"],
        description = res["description"],
        famille = res["famille"],
        classe = res["classe"],
        genre = res["genre"],
        espece = res["espece"],
        info = res["info"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nom': nom,
      'regime': regime,
      'zones': zones,
      'estVertebre': estVertebre == true ? 1 : 0,
      'image': image,
      'description': description,
      'famille': famille,
      'classe': classe,
      'genre': genre,
      'espece': espece,
      'info': info,
    };
  }

  static List<Animal> listOfAnimals = [
    Animal(
        nom: "Caméléon panthère",
        regime: "aye",
        zones: "Présent dans tout Madagascar",
        estVertebre: true,
        image:
            "[assets/reptiles/cameleon_panthere.jpg,assets/reptiles/cameleon_panthere.jpg,assets/reptiles/cameleon_panthere.jpg]",
        classe: 1,
        famille: 1,
        genre: 1,
        description: 'blabla',
        info: 'blabla',
        espece: ' 1'),
    Animal(
        nom: "black lemur",
        regime: "Carnivore",
        zones: "Principalement dans les forêts de lest de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/cameleon_nain.jpg]",
        classe: 1,
        famille: 1,
        genre: 2,
        description: 'blabla',
        info: 'blabla',
        espece: ' 2'),
    Animal(
        nom: "coquerel",
        regime: "Carnivore",
        zones:
            "Présent dans certaines régions côtières et fluviales de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/crocodile_nil.jpg]",
        classe: 1,
        famille: 2,
        description: 'blabla',
        info: 'blabla',
        genre: 3,
        espece: ' 3'),
    Animal(
        nom: "propithecus coronatus",
        regime: "Carnivore",
        zones: "Répartis dans différentes régions de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/gecko_queue_plat.jpg]",
        classe: 1,
        famille: 2,
        genre: 3,
        description: 'blabla',
        info: 'blabla',
        espece: ' 3'),
    Animal(
        nom: "Serpent-lézard",
        regime: "Omnivore",
        zones: "Présent dans les forêts sèches du sud de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/serpent_tete_vipere.jpg]",
        classe: 1,
        famille: 3,
        description: 'blabla',
        info: 'blabla',
        genre: 4,
        espece: ' 4'),
    Animal(
        nom: "Tortue radiée",
        regime: "Herbivore",
        zones: "Endémique du sud et du sud-ouest de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/tortue_radiée.jpg]",
        classe: 1,
        famille: 4,
        genre: 5,
        description: 'blabla',
        info: 'blabla',
        espece: ' 5'),
    Animal(
        nom: "Boa de Madagascar",
        regime: "Carnivore",
        zones: "Principalement dans les forêts de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/boa_madagascar.jpg]",
        classe: 1,
        description: 'blabla',
        info: 'blabla',
        famille: 5,
        genre: 6,
        espece: ' 6'),
    Animal(
        nom: "Caméléon de Parson",
        regime: "Carnivore",
        zones: "Présent dans les forêts humides du nord-est de Madagascar",
        estVertebre: true,
        image: "[assets/reptiles/cameleon_nain.jpg]",
        classe: 1,
        famille: 0,
        description: 'blabla',
        info: 'blabla',
        genre: 7,
        espece: ' 7'),
    Animal(
        nom: "Serpent à tête de vipère",
        regime: "Carnivore",
        zones:
            "Trouvé dans certaines régions de Madagascar, notamment dans les zones forestières",
        estVertebre: true,
        image: "[assets/reptiles/boa_madagascar.jpg]",
        classe: 1,
        description: 'blabla',
        info: 'blabla',
        famille: 6,
        genre: 8,
        espece: ' 8'),
  ];
}
