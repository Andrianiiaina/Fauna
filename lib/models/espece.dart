class Espece {
  dynamic idEsp;
  String nomEsp;
  String descriptionEsp;
  Espece({this.idEsp, required this.nomEsp, required this.descriptionEsp});

  Espece.fromMap(Map<String, dynamic> res)
      : idEsp = res["idEsp"],
        nomEsp = res["nomEsp"],
        descriptionEsp = res["descriptionEsp"];

  Map<String, Object?> toMap() {
    return {
      'idEsp': idEsp,
      'nomEsp': nomEsp,
      'descriptionEsp': descriptionEsp,
    };
  }
#populate data avec des données sur gpt//à supprimer later
  static List<Espece> especes = [
    Espece(
        nomEsp: "Furcifer pardalis",
        descriptionEsp:
            "Caméléon panthère - C'est l'un des caméléons les plus emblématiques de Madagascar."),
    Espece(
        nomEsp: "Brookesia minima",
        descriptionEsp:
            "Caméléon nain - Ce caméléon est l'un des plus petits reptiles du monde."),
    Espece(
        nomEsp: "Crocodylus niloticus",
        descriptionEsp:
            "Crocodile du Nil - Bien que l'on puisse trouver des crocodiles du Nil dans plusieurs pays d'Afrique, Madagascar abrite une population distincte de cette espèce."),
    Espece(
        nomEsp: "Uroplatus spp.",
        descriptionEsp:
            "Geckos à queue plate - Madagascar est connue pour ses geckos à queue plate, qui ont une apparence étonnante avec leur corps plat et leur capacité à se camoufler."),
    Espece(
        nomEsp: "Langaha madagascariensis",
        descriptionEsp:
            "Serpent-lézard - C'est un lézard unique à Madagascar, qui ressemble à un serpent mais est en réalité un lézard non-venimeux."),
    Espece(
        nomEsp: "Astrochelys radiata",
        descriptionEsp:
            "Tortue radiée - La tortue radiée est une espèce endémique de Madagascar, reconnaissable à son motif de rayures jaunes sur sa carapace."),
    Espece(
        nomEsp: "Sanzinia madagascariensis",
        descriptionEsp:
            "Boa de Madagascar - Ce serpent non-venimeux est l'un des plus grands serpents de Madagascar."),
    Espece(
        nomEsp: "Calumma parsonii",
        descriptionEsp:
            "Caméléon de Parson - Le caméléon de Parson est l'un des plus grands caméléons du monde."),
    Espece(
        nomEsp: "Atractaspis microlepidota",
        descriptionEsp:
            "Serpent à tête de vipère - C'est un serpent venimeux que l'on peut trouver dans certaines régions de Madagascar."),
    Espece(
        nomEsp: "Phelsuma madagascariensis",
        descriptionEsp:
            "Gecko diurne à queue plate - Ce gecko diurne est répandu à Madagascar."),
    //oiseaux
    Espece(
        nomEsp: "Mesitornis variegatus",
        descriptionEsp:
            "Mesite varié - C'est un oiseau endémique de Madagascar."),
    Espece(
        nomEsp: "Neomixis tenella",
        descriptionEsp:
            "Sylvielle délicate - C'est un petit oiseau chanteur de la famille des Cisticolidae."),
    Espece(
        nomEsp: "Coua caerulea",
        descriptionEsp:
            "Coua bleu - C'est un oiseau terrestre de la famille des Cuculidae."),
    Espece(
        nomEsp: "Eutriorchis astur",
        descriptionEsp:
            "Busard d'Henst - C'est un rapace diurne endémique de Madagascar."),
    Espece(
        nomEsp: "Tyto soumagnei",
        descriptionEsp:
            "Effraie de Soumagne - C'est une chouette endémique de Madagascar."),
    Espece(
        nomEsp: "Alectroenas madagascariensis",
        descriptionEsp:
            "Pigeon rose - C'est un pigeon endémique de Madagascar."),
    //insectes
    Espece(
        nomEsp: "Aponogeton madagascariensis",
        descriptionEsp:
            "Le papillon bleu de Madagascar (Aponogeton madagascariensis) est une espèce de papillon endémique de Madagascar. Il se distingue par ses ailes bleu vif et sa taille moyenne. On le trouve principalement dans les forêts tropicales de l'île."),
    Espece(
        nomEsp: "Giraffe weevil",
        descriptionEsp:
            "Le Charançon girafe (Trachelophorus giraffa) est un insecte unique à Madagascar. Il tire son nom de son long cou, qui est plus prononcé chez les mâles. Ces charançons se nourrissent de feuilles et vivent dans les arbres."),
    Espece(
        nomEsp: "Praying Mantis",
        descriptionEsp:
            "La Mante religieuse (Mantis religiosa) est un insecte prédateur présent à Madagascar. Elle se distingue par son apparence unique, avec ses pattes avant puissantes qu'elle utilise pour attraper ses proies. Les mantes religieuses se nourrissent principalement d'autres insectes."),
    Espece(
        nomEsp: "Saturniidae",
        descriptionEsp:
            "Le papillon soyeux de Madagascar (Saturniidae) est une famille de papillons nocturnes présente sur l'île. Ces papillons sont connus pour leur grande taille et leurs motifs colorés sur leurs ailes. Certains membres de cette famille ont également des chenilles impressionnantes."),
    Espece(
        nomEsp: "Tenrec ecaudatus",
        descriptionEsp:
            "Le tenrec malgache (Tenrec ecaudatus) est un petit mammifère endémique de Madagascar. Bien qu'il ne soit pas un insecte, il est inclus ici car il est souvent associé à l'écosystème de l'île. Les tenrecs se nourrissent d'insectes, de vers et d'autres petites proies."),
    Espece(
        nomEsp: "Phelsuma grandis",
        descriptionEsp:
            "Le gecko géant de Madagascar (Phelsuma grandis) est une espèce de lézard diurne que l'on trouve à Madagascar. Bien qu'il ne soit pas un insecte, il est souvent associé à l'écosystème de l'île. Les geckos géants de Madagascar se nourrissent principalement d'insectes et de nectar.")
  ];
}
