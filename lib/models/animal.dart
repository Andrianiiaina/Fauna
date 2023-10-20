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
  String famille;
  String info;
  String genre;
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
      nom: "Sifaka de Coquerel",
      regime:
          "Herbivore |  Ils se nourrissent de feuilles, de fleurs, de fruits et parfois de graines",
      famille: "Indridae",
      genre: "Propithecus",
      espece: "Propithecus coquereli",
      description:
          "Le Sifaka de Coquerel est un lémurien herbivore de Madagascar. Il se distingue par son pelage blanc avec des taches brunes et son agilité dans les arbres. Sa durée de vie est d'environ 15 à 18 ans.",
      zones:
          "Se trouvent principalement dans les régions de la côte ouest de Madagascar, en particulier dans les zones de forêts sèches.Voici des zones spécifiques :Réserve de Réserve d'Ankarafantsika. La région de Bemaraha, notamment le parc national des Tsingy de Bemaraha,  La réserve forestière de Kirindy",
      info:
          "Le Sifaka de Coquerel est réputé pour ses sauts impressionnants d'arbre en arbre, grâce à ses longues pattes et à son agilité exceptionnelle.",
      estVertebre: true,
      image:
          "[assets/mammiferes/coquerel  (1).jpg,assets/mammiferes/coquerel (3).jpg,assets/mammiferes/coquerel (10).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Lemur Couronné",
      regime:
          " le Lemur Couronné est principalement frugivore. Ils se nourrissent de fruits, de fleurs, de feuilles et de nectar. Ces lémuriens jouent un rôle important dans la dispersion des graines à travers la forêt, contribuant ainsi à la régénération des plantes. ",
      famille: "Lemuridae",
      genre: "Eulemur",
      espece: "Eulemur coronatus",
      description:
          "Le Lemur Couronné est un lémurien frugivore de Madagascar. Il porte son nom en raison de la couronne de poils sur sa tête. Sa durée de vie est d'environ 15 à 20 ans.",
      zones:
          "se trouvent principalement dans les régions de la côte ouest de Madagascar, en particulier dans les zones de forêts sèches. Zones spécifiques :Réserve de Réserve d'Ankarafantsika,Réserve de Bemaraha,Réserve de Kirindy",
      info:
          "Le Lemur Couronné joue un rôle important dans la dispersion des graines grâce à son régime alimentaire frugivore, contribuant ainsi à la biodiversité des forêts de Madagascar.",
      estVertebre: true,
      image:
          "[assets/mammiferes/eulemur-coronatus  (2).png,assets/mammiferes/eulemur-coronatus  (7).jpg,assets/mammiferes/eulemur-coronatus  (9).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Sifaka Soyeux",
      regime:
          "Herbivore |  Ils se nourrissent de feuilles, de fleurs, de fruits et parfois de graines",
      famille: "Indridae",
      genre: "Propithecus",
      espece: "Propithecus candidus",
      description:
          "Le Sifaka Soyeux est un lémurien herbivore rare de Madagascar. Il a un pelage blanc soyeux et des yeux orange vif. Sa durée de vie est d'environ 18 à 20 ans.",
      zones:
          "Se trouvent principalement dans les régions de la côte ouest de Madagascar, en particulier dans les zones de forêts sèches.Voici des zones spécifiques :Réserve de Réserve d'Ankarafantsika. La région de Bemaraha, notamment le parc national des Tsingy de Bemaraha,  La réserve forestière de Kirindy",
      info:
          "Le Sifaka Soyeux est menacé en raison de la perte d'habitat et est considéré comme l'un des primates les plus en danger d'extinction.",
      estVertebre: true,
      image:
          "[assets/mammiferes/soyeux (3).webp,assets/mammiferes/soyeux (8).jpg,assets/mammiferes/soyeux (9).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Sifaka Couronné",
      regime:
          "Ils se nourrissent principalement de feuilles, de bourgeons et de fleurs, et sont adaptés à la vie arboricole.",
      famille: "Indridae",
      genre: "Propithecus",
      espece: "Propithecus coronatus",
      description:
          "Le Sifaka Couronné est un lémurien herbivore de Madagascar. Il a un pelage blanc avec des taches brunes et une couronne distinctive de poils sur la tête. Sa durée de vie est d'environ 15 à 20 ans.",
      zones:
          "Le Sifaka Couronné (Propithecus coronatus) se trouve dans les forêts de Madagascar. Vous pouvez observer le Sifaka Couronné dans des endroits comme la Réserve Naturelle Intégrale de Tsingy de Namoroka, le Parc National de Marojejy, et d'autres zones forestières du nord et de l'ouest de Madagascar. Ces lémuriens sont souvent présents dans les régions de forêts primaires et secondaires.",
      info:
          "Le Sifaka Couronné est connu pour son élégance dans les mouvements, se déplaçant en effectuant des sauts entre les arbres, grâce à sa morphologie adaptée.",
      estVertebre: true,
      image:
          "[assets/mammiferes/propithecus-coronatus ..jpg,assets/mammiferes/propithecus-coronatus (1).jpg,assets/mammiferes/propithecus-coronatus (4).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Varecia Rubra",
      regime:
          "Ils se nourrissent principalement de fruits, contribuant ainsi à la dispersion des graines dans la forêt",
      famille: "Indridae",
      genre: "Varecia",
      espece: "Varecia rubra",
      description:
          "Le Varecia Rubra, également connu sous le nom de Vari Roux, est un lémurien frugivore de Madagascar. Il a un pelage rougeâtre et noir vif. Sa durée de vie est d'environ 18 à 20 ans.",
      zones:
          "se trouve dans les forêts tropicales humides de Madagascar. Ces lémuriens peuvent être observés dans des endroits tels que la Réserve de Mantadia, le Parc National de Marojejy, et d'autres forêts tropicales de l'est de Madagascar.",
      info:
          "Le Varecia Rubra est un excellent grimpeur et se nourrit principalement de fruits, contribuant ainsi à la dispersion des graines dans la forêt.",
      estVertebre: true,
      image:
          "[assets/mammiferes/red-ruffed  (3).jpg,assets/mammiferes/red-ruffed (8).jpg,assets/mammiferes/red-ruffed (10).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Indri Indri",
      regime:
          "L'Indri Indri est principalement herbivore, se nourrissant de feuilles, de fleurs et de fruits. Ils ont un régime alimentaire spécialisé et sont adaptés aux feuilles toxiques de certaines plantes qu'ils consomment",
      famille: "Indridae",
      genre: "Indri",
      espece: "Indri Indri",
      description:
          "L'Indri Indri est un grand lémurien de Madagascar, caractérisé par son pelage noir et blanc, de grands yeux et une queue très courte. Il a une durée de vie d'environ 15 à 20 ans.",
      zones:
          "Ils se trouvent principalement dans les forêts humides de l'est de Madagascar.Zones:Parc National d'Andasibe-Mantadia,Réserve de Zahamena,Réserve Spéciale d'Analamazaotra (ou Pérananatena) ",
      info:
          "L'Indri Indri est connu pour son cri distinctif, souvent décrit comme un chant mélancolique.",
      estVertebre: true,
      image:
          "[assets/mammiferes/indri-indri (1).jpg,assets/mammiferes/indri-indri (1).jpg,assets/mammiferes/indri-indri (10).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Lémur Noir",
      regime: "Omnivore",
      famille: "Lemuridae",
      genre: "Lemur",
      espece: "Lemur species",
      description:
          "Le Lemur Noir est un lémurien omnivore de Madagascar. Il a un pelage noir distinctif et une durée de vie d'environ 18 à 20 ans.",
      zones: "Forêts de Madagascar",
      info:
          "Le Lemur Noir est connu pour sa capacité à se déplacer agilité à travers les arbres.",
      estVertebre: true,
      image:
          "[assets/mammiferes/black-lemur (2).jpg,assets/mammiferes/black-lemur (4).jpg,assets/mammiferes/black-lemur (10).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Lémur Fauve",
      regime: "Frugivore",
      famille: "Lemuridae",
      genre: "Eulemur",
      espece: "Eulemur fulvus",
      description:
          "Le Lemur Fauve est un lémurien frugivore de Madagascar. Il a un pelage de couleur fauve et des yeux brillants. Sa durée de vie est d'environ 20 ans.",
      zones: "Forêts côtières et de montagne de Madagascar",
      info:
          "Le Lemur Fauve est connu pour sa sociabilité et son comportement grégaire, vivant en groupes sociaux qui peuvent compter jusqu'à 30 individus.",
      estVertebre: true,
      image:
          "[assets/mammiferes/eulemur-fulvus  (3).jpg,assets/mammiferes/eulemur-fulvus  (6).jpg,assets/mammiferes/eulemur-fulvus  (10).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Fossa",
      regime: "Carnivore",
      famille: "Eupleridae",
      genre: "Cryptoprocta",
      espece: "Cryptoprocta ferox",
      description:
          "Le Fossa est un mammifère carnivore endémique de Madagascar. Il ressemble à un mélange entre un chat et un chien. Il a un corps long et mince avec une queue touffue. Sa durée de vie est d'environ 15 à 20 ans.",
      zones: "Forêts tropicales de Madagascar",
      info:
          "Le Fossa est un excellent chasseur et grimpeur, ce qui en fait un prédateur redoutable dans les arbres.",
      estVertebre: true,
      image:
          "[assets/mammiferes/fossa (1).jpg,assets/mammiferes/fossa (2).jpg,assets/mammiferes/fossa (10).jpeg]",
      classe: 0,
    ),
    Animal(
      nom: "Hapalémur Gris",
      regime: "Herbivore",
      famille: "Indridae",
      genre: "Hapalemur",
      espece: "Hapalemur griseus",
      description:
          "L'Hapalemur Gris, également connu sous le nom de Lémur Bambou Gris, est un lémurien herbivore de Madagascar. Il a un pelage gris et blanc, adapté à son habitat forestier. Sa durée de vie est d'environ 18 à 20 ans.",
      zones: "Forêts de bambous de Madagascar",
      info:
          "L'Hapalemur Gris se nourrit principalement de bambous, ce qui en fait l'un des rares primates à se nourrir de cette ressource.",
      estVertebre: true,
      image:
          "[assets/mammiferes/hapalemur-griseus  (8).jpg,assets/mammiferes/hapalemur-griseus  (14).jpg,assets/mammiferes/hapalemur-griseus  (17).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Lémur Catta",
      regime: "Frugivore",
      famille: "Lemuridae",
      genre: "Lemur",
      espece: "Lemur catta",
      description:
          "Le Lemur Catta, également connu sous le nom de Maki Catta, est un lémurien frugivore de Madagascar. Il a un pelage gris avec des anneaux noirs et blancs sur la queue. Sa durée de vie est d'environ 20 ans.",
      zones: "Régions arides et semi-arides du sud de Madagascar",
      info:
          "Le Lemur Catta est connu pour sa démarche bipède distinctive et sa capacité à sunbath en groupe le matin pour se réchauffer.",
      estVertebre: true,
      image:
          "[assets/mammiferes/maki-catta (3).jpg,assets/mammiferes/maki-catta (6).jpg,assets/mammiferes/maki-catta (8).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Galidia Elegant",
      regime: "Carnivore",
      famille: "Eupleridae",
      genre: "Galidia",
      espece: "Galidia elegans",
      description:
          "Le Galidia Elegant est un petit mammifère carnivore de Madagascar. Il ressemble à une petite mangouste avec un corps élancé et une queue touffue. Sa durée de vie est d'environ 8 à 10 ans.",
      zones: "Forêts tropicales de Madagascar",
      info:
          "Le Galidia Elegant est un chasseur agile, se nourrissant principalement d'insectes, de petits mammifères et d'oiseaux.",
      estVertebre: true,
      image:
          "[assets/mammiferes/mangouste (2).jpg,assets/mammiferes/mangouste (3).jpg,assets/mammiferes/mangouste (5).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Microcebe Mignon",
      regime: "Omnivore",
      famille: "Cheirogaleidae",
      genre: "Microcebus",
      espece: "Microcebus murinus",
      description:
          "Le Microcebe Mignon est le plus petit primate du monde, endémique de Madagascar. Il a un pelage brun-gris et de grands yeux. Sa durée de vie est d'environ 6 à 8 ans.",
      zones: "Forêts de Madagascar",
      info:
          "Le Microcebe Mignon est principalement nocturne et se nourrit d'une variété d'aliments, y compris des insectes, des fruits et de la sève des arbres.",
      estVertebre: true,
      image:
          "[assets/mammiferes/microcebus (6).jpg,assets/mammiferes/microcebus (9).jpg,assets/mammiferes/microcebus (10).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Echinops Telfairi",
      regime: "Omnivore",
      famille: "Tenrecidae",
      genre: "Echinops",
      espece: "Echinops telfairi",
      description:
          "L'Echinops Telfairi est un petit mammifère omnivore de Madagascar, également connu sous le nom de Tenrec de Telfair. Il a un pelage épineux et une queue courte. Sa durée de vie est d'environ 5 à 8 ans.",
      zones: "Forêts de Madagascar",
      info:
          "L'Echinops Telfairi est remarquable pour ses épines dorsales, qui lui servent de moyen de défense contre les prédateurs.",
      estVertebre: true,
      image:
          "[assets/mammiferes/porc-epique (2).jpg,assets/mammiferes/porc-epique (4).jpg,assets/mammiferes/porc-epique (7).jpg]",
      classe: 0,
    ),
    Animal(
      nom: "Tenrec Zèbre",
      regime: "Insectivore",
      famille: "Tenrecidae",
      genre: "Hemicentetes",
      espece: "Hemicentetes semispinosus",
      description:
          "Le Tenrec Zèbre est un petit mammifère insectivore de Madagascar. Il a un pelage zébré noir et blanc et des épines sur le dos. Sa durée de vie est d'environ 4 à 6 ans.",
      zones: "Forêts de Madagascar",
      info:
          "Le Tenrec Zèbre est nocturne et se nourrit principalement d'insectes, utilisant son odorat et ses vibrisses sensibles pour chasser la nuit.",
      estVertebre: true,
      image:
          "[assets/mammiferes/tenrec-zebre (2).jpg,assets/mammiferes/tenrec-zebre (3).jpg]",
      classe: 0,
    ),
    Animal(
        nom: "Propithecus Diadema",
        regime: "Herbivore",
        famille: "Indridae",
        genre: "Propithecus",
        espece: "Propithecus diadema",
        description:
            "Le Propithecus Diadema, également connu sous le nom de Sifaka Diadème, est un lémurien herbivore de Madagascar. Il a un pelage blanc avec des taches noires sur le visage et une couronne distinctive sur la tête. Sa durée de vie est d'environ 18 à 20 ans.",
        zones: "Forêts de Madagascar",
        info:
            "Le Propithecus Diadema est connu pour ses sauts gracieux d'arbre en arbre, effectués en tenant les bras dans l'air pour faciliter ses déplacements.",
        estVertebre: true,
        image:
            "[assets/mammiferes/propithecus-diadema  (3).jpg,assets/mammiferes/propithecus-diadema  (5).jpg,assets/mammiferes/propithecus-diadema  (9).jpg]",
        classe: 0),
    Animal(
        nom: "Caméléon Boohesia",
        regime: "Insectivore",
        famille: "Chamaeleonidae",
        genre: "Boohesia",
        espece: "Boohesia sp.",
        description:
            "Le Caméléon Boohesia est un reptile insectivore de Madagascar. Il a une peau écailleuse, des yeux mobiles indépendants et une langue extensible pour capturer ses proies. Sa durée de vie est d'environ 3 à 5 ans.",
        zones: "Forêts tropicales de Madagascar",
        info:
            "Le Caméléon Boohesia est expert dans l'art du camouflage, capable de changer de couleur pour se fondre dans son environnement et échapper aux prédateurs.",
        estVertebre: true,
        image:
            "[assets/reptiles/chameleon boohesia (1).jpg,assets/reptiles/chameleon boohesia (2).jpg,assets/reptiles/chameleon boohesia (3).jpg]",
        classe: 1),
    Animal(
      nom: "Caméléon Panthère",
      regime: "Insectivore",
      famille: "Chamaeleonidae",
      genre: "Furcifer",
      espece: "Furcifer pardalis",
      description:
          "Le Caméléon Panthère est un caméléon coloré de Madagascar. Il a une peau rayée de différentes couleurs, y compris le vert, le rouge et le bleu, pour se camoufler dans son habitat. Sa durée de vie est d'environ 5 à 7 ans.",
      zones: "Forêts et zones arides de Madagascar",
      info:
          "Le Caméléon Panthère a la capacité de bouger chaque œil indépendamment, lui offrant une vision panoramique pour détecter les proies et les menaces.",
      estVertebre: true,
      image:
          "[assets/reptiles/chameleon panthere (4).jpg,assets/reptiles/chameleon panthere (11).jpg,assets/reptiles/chameleon panthere (20).jpg]",
      classe: 1,
    ),
    Animal(
      nom: "Crocodile du Nil",
      regime: "Carnivore",
      famille: "Crocodylidae",
      genre: "Crocodylus",
      espece: "Crocodylus niloticus",
      description:
          "Le Crocodile du Nil est un reptile carnivore de grande taille, répandu en Afrique subsaharienne, y compris à Madagascar. Il a un corps robuste, une peau écailleuse et des mâchoires puissantes. Sa durée de vie est d'environ 70 à 100 ans.",
      zones:
          "Rivières, lacs et marécages à Madagascar, ainsi qu'en Afrique subsaharienne",
      info:
          "Le Crocodile du Nil est un prédateur redoutable, capable de se camoufler dans l'eau et d'attaquer rapidement ses proies avec une force impressionnante.",
      estVertebre: true,
      image:
          "[assets/reptiles/croco du nil (3).jpg,assets/reptiles/croco du nil (4).jpg,assets/reptiles/croco du nil (5).jpg]",
      classe: 1,
    ),
    Animal(
      nom: "Gecko Géant",
      regime: "Insectivore",
      famille: "Gekkonidae",
      genre: "Phelsuma",
      espece: "Phelsuma grandis",
      description:
          "Le Gecko Géant, ou Phelsuma grandis, est un lézard insectivore endémique de Madagascar. Il a une couleur verte vive, parfois agrémentée de taches rouges. Sa durée de vie est d'environ 10 à 15 ans.",
      zones: "Forêts tropicales de Madagascar",
      info:
          "Le Gecko Géant est connu pour ses couleurs vives et son comportement diurne. Il est souvent observé se prélassant au soleil sur les arbres.",
      estVertebre: true,
      image:
          "[assets/reptiles/geko phelsuma (10).jpg,assets/reptiles/geko phelsuma (11).jpg,assets/reptiles/geko phelsuma (16).jpg]",
      classe: 1,
    ),
    Animal(
      nom: "Tortue Étoilée",
      regime: "Herbivore",
      famille: "Testudinidae",
      genre: "Geochelone",
      espece: "Geochelone elegans",
      description:
          "La Tortue Étoilée est une grande tortue terrestre originaire de Madagascar. Elle a un carapace haute et bombée avec des motifs en étoile distinctifs. Sa durée de vie est d'environ 70 à 100 ans.",
      zones: "Savanes et forêts sèches de Madagascar",
      info:
          "La Tortue Étoilée est menacée en raison du braconnage et de la destruction de son habitat. Elle est protégée par des lois internationales et locales.",
      estVertebre: true,
      image:
          "[assets/reptiles/graeca (7).jpeg,assets/reptiles/graeca (15).jpeg,assets/reptiles/graeca (17).jpeg]",
      classe: 1,
    ),
    Animal(
      nom: "Tortue Radiée",
      regime: "Herbivore",
      famille: "Testudinidae",
      genre: "Astrochelys",
      espece: "Astrochelys radiata",
      description:
          "La Tortue Radiée est une espèce de tortue terrestre endémique du sud et du sud-ouest de Madagascar. Elle a un carapace orné de motifs en forme d'étoile, d'où son nom. Sa durée de vie est d'environ 100 ans.",
      zones: "Savanes arides et buissons épineux de Madagascar",
      info:
          "La Tortue Radiée est l'une des espèces de tortues les plus menacées au monde en raison du commerce illégal des animaux de compagnie et de la perte d'habitat.",
      estVertebre: true,
      image:
          "[assets/reptiles/radiata (8).jpeg,assets/reptiles/radiata (15).jpeg,assets/reptiles/radiata (16).jpeg]",
      classe: 1,
    ),
    Animal(
      nom: "Langaha",
      regime: "Insectivore",
      famille: "Dactyloidae",
      genre: "Langaha",
      espece: "Langaha madagascariensis",
      description:
          "Le Langaha est un caméléon insectivore de Madagascar. Il a un corps mince, des yeux mobiles et une langue extensible pour capturer ses proies. Sa durée de vie est d'environ 5 à 8 ans.",
      zones: "Forêts de Madagascar",
      info:
          "Le Langaha est spécialisé dans le mimétisme, ressemblant à une brindille ou une feuille morte pour échapper à la prédation. Son apparence étrange lui permet de se confondre avec son environnement.",
      estVertebre: true,
      image:
          "[assets/reptiles/langaha (1).jpg,assets/reptiles/langaha (3).jpg,assets/reptiles/langaha (7).jpg]",
      classe: 1,
    ),
    Animal(
      nom: "Boa Arboricole",
      regime: "Carnivore",
      famille: "Boidae",
      genre: "Corallus",
      espece: "Corallus hortulanus",
      description:
          "Le Boa Arboricole est un serpent carnivore des régions tropicales d'Amérique du Sud et d'Amérique centrale. Il a un corps robuste et préhensile, adapté à la vie arboricole. Sa durée de vie est d'environ 20 à 30 ans.",
      zones: "Forêts tropicales d'Amérique du Sud et d'Amérique centrale",
      info:
          "Le Boa Arboricole chasse principalement la nuit, se suspendant aux branches pour capturer des oiseaux et des petits mammifères. Il est un excellent grimpeur grâce à ses écailles ventrales modifiées.",
      estVertebre: true,
      image:
          "[assets/reptiles/sanzinia (5).JPG,assets/reptiles/sanzinia (6).jpg,assets/reptiles/sanzinia (7).jpg]",
      classe: 1,
    ),
    Animal(
        nom: "Boa de Madagascar",
        regime: "Carnivore",
        famille: "Boidae",
        genre: "Acrantophis",
        espece: "Acrantophis madagascariensis",
        estVertebre: true,
        image:
            "[assets/reptiles/boa (4).jpg,assets/reptiles/boa (5).jpg,assets/reptiles/boa (11).jpg]",
        classe: 1,
        description:
            "Le Boa de Madagascar est un serpent constrictor de taille moyenne à grande, caractérisé par son corps massif et musclé. Il a un motif de couleur variable, allant du brun clair au brun foncé avec des motifs sombres. Sa durée de vie est d'environ 20 à 30 ans.",
        zones: "Forêts tropicales et zones boisées de Madagascar",
        info:
            "Le Boa de Madagascar est un prédateur nocturne qui se nourrit principalement de petits mammifères, d'oiseaux et de lézards. Il tue ses proies en les étouffant avec son corps puissant avant de les avaler entières."),
    Animal(
      nom: "Aye-aye",
      regime: "Omnivore",
      famille: "Daubentoniidae",
      genre: "Daubentonia",
      espece: "Daubentonia madagascariensis",
      description:
          "L'Aye-aye est un primate nocturne de taille moyenne avec un pelage long et hirsute de couleur foncée. Il a de grands yeux, des oreilles pointues et un long doigt osseux très fin, appelé le 'doigt d'Aye-aye', utilisé pour extraire les insectes des crevasses des arbres. Sa durée de vie est d'environ 20 à 23 ans.",
      zones: "Forêts tropicales de Madagascar",
      info:
          "L'Aye-aye est connu pour son comportement unique de recherche de nourriture. Il tambourine avec son doigt d'Aye-aye sur l'écorce des arbres pour détecter les larves d'insectes cachées, puis utilise le même doigt pour extraire les proies et les manger.",
      estVertebre: true,
      image:
          "[assets/mammiferes/aye  (3).jpg,assets/mammiferes/aye  (7).jpg,assets/mammiferes/aye  (10).jpg]",
      classe: 0,
    )
  ];
}
