import 'package:fauna_scan/models/bibliotheque.dart';
import 'package:fauna_scan/models/classe.dart';
import 'package:flutter/material.dart';
import '../models/database_manager.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/animal.dart';
import 'package:go_router/go_router.dart';

class ScanResultPage extends StatefulWidget {
  final int id;
  final currentImage;
  final String percentage;
  const ScanResultPage(
      {Key? key,
      required this.id,
      required this.currentImage,
      required this.percentage})
      : super(key: key);

  @override
  State<ScanResultPage> createState() => _ScanResultPageState();
}

class _ScanResultPageState extends State<ScanResultPage> {
  late Map<String, dynamic> animal = {};
  final handler = DatabaseManager();
  late String nom;
  Future addToBiblio(String nom) async {
    final appDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory('${appDir.path}/images');
    if (!imagesDir.existsSync()) imagesDir.createSync(recursive: true);
    final newImagePath = '${imagesDir.path}/${DateTime.now().second}.jpg';

    if (!File(newImagePath).existsSync() && widget.currentImage.path != "") {
      await File(widget.currentImage.path).copy(newImagePath);
    }
    await handler.insertBibliotheque(Bibliotheque(
        nomAnimal: nom,
        imageAnimal: newImagePath,
        descriptionAnimal: "on verra"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Map<String, dynamic>?>(
      future: handler.fetchAnimal(widget.id),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Aucun animal correspondant');
        } else {
          final Map<String, dynamic>? animal = snapshot.data;
          if (animal != null) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: Stack(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width,
                              child: widget.currentImage.path.isNotEmpty
                                  ? Image.file(
                                      File(widget.currentImage.path),
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.contain,
                                    )
                                  : const Text(
                                      "un problème lors du chargement de l'image")),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.4 - 50,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 40, right: 20),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            animal['nom'],
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 22),
                                          ),
                                          //Colors.green,
                                          subtitle: Text(
                                            "${animal['genre']} ${animal['espece']}",
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          // (${widget.percentage} %)
                          const Text('Meilleure correspondance:'),
                          SizedBox(
                            width: 800,
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: Animal.getLink(animal['image']).length,
                              itemBuilder: ((context, index) {
                                final image =
                                    Animal.getLink(animal['image'])[index];
                                return Image(
                                  image: AssetImage(image),
                                  height: 100,
                                  width: 100,
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //Text("à ${widget.percentage} %"),
                          const Text('Le saviez-vous?'),
                          Text(
                            animal['info'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Roboto",
                                fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          const Text('Description'),
                          Text(
                            animal['description'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Roboto",
                                fontSize: 16),
                          ),
                          ListTile(
                            leading: const Icon(Icons.food_bank,
                                color: Colors.brown),
                            title: Text(
                              animal['regime'],
                              style: const TextStyle(
                                  color: Color.fromARGB(157, 54, 45, 41),
                                  fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.class_, color: Colors.brown),
                            title: Text(
                              Classe.classes[animal['classe']].nomCls,
                              style: const TextStyle(
                                  color: Color.fromARGB(157, 54, 45, 41),
                                  fontSize: 14),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.location_on,
                                color: Colors.brown),
                            title: Text(
                              animal['zones'],
                              style: const TextStyle(
                                  color: Color.fromARGB(157, 54, 45, 41),
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 10),
                          /**
                         *   Text('Image similaire:'),
                          Image(
                            image: AssetImage(animal['image']),
                            height: 100,
                          ),
                         */
                          Container(
                            height: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                addToBiblio(animal['nom']);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text('Image ajouter à la collection'),
                                  duration: Duration(seconds: 2),
                                ));
                              },
                              child: const Text('Ajouter à ma collection'),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Desolé fauna-scan pas reconnu l'animal que vous avez scanné, essayer de prendre une autre photo ou rapportez l'animal non reconnu à l'admisistrateur."),
                  ElevatedButton(
                      onPressed: () {
                        context.go('/add_espece');
                      },
                      child: const Text('Rapporter')),
                ],
              ),
            );
          }
        }
      }),
    ));
  }
}
