import 'package:fauna_scan/models/classe.dart';
import 'package:flutter/material.dart';
import '../models/database_manager.dart';
import '../models/animal.dart';

class ShowAnimal extends StatefulWidget {
  final int id;
  const ShowAnimal({Key? key, required this.id}) : super(key: key);

  @override
  State<ShowAnimal> createState() => _ShowAnimalState();
}

class _ShowAnimalState extends State<ShowAnimal> {
  late Map<String, dynamic> animal = {};
  final handler = DatabaseManager();
  @override
  void initState() {
    super.initState();
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
            return Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.1,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              image: AssetImage(
                                  Animal.getLink(animal['image'])[0]),
                              fit: BoxFit.contain,
                            ),
                          ),
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
                          //Text("à ${widget.percentage} %"),
                          const Text('Le saviez-vous?'),
                          Text(
                            animal['descriptionEsp'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Roboto",
                                fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          const Text('Description'),
                          Text(
                            animal['descriptionEsp'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: "Roboto",
                                fontSize: 16),
                          ),
                          Text(
                            animal['descriptionEsp'],
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
                            leading: const Icon(Icons.home_filled,
                                color: Colors.brown),
                            title: Text(
                              animal['zones'],
                              style: const TextStyle(
                                  color: Color.fromARGB(157, 54, 45, 41),
                                  fontSize: 14),
                            ),
                          ),
                          SizedBox(height: 10),
                          /**
                         *   Text('Image similaire:'),
                          Image(
                            image: AssetImage(animal['image']),
                            height: 100,
                          ),
                         */
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text("Non trouvé");
          }
        }
      }),
    ));
  }
}
