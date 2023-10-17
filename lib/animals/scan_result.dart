import 'package:fauna_scan/models/classe.dart';
import 'package:flutter/material.dart';
import '../models/database_manager.dart';
import 'animal_list.dart';
import 'dart:io';

class ScanResultPage extends StatefulWidget {
  final int id;
  final String currentImage;
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
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.48,
                        width: MediaQuery.of(context).size.width,
                        child: widget.currentImage.isNotEmpty
                            ? Image.file(
                                File(widget.currentImage),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              )
                            : Text('nada')),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.48 - 50,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.only(
                                  top: 40, left: 40, right: 20),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      animal['nom'],
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 28),
                                    ),
                                    //Colors.green,
                                    subtitle: Text(
                                      "${animal['espece']}",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 26,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    animal['descriptionEsp'],
                                    maxLines: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Roboto",
                                        fontSize: 16),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.food_bank,
                                        color: Colors.brown),
                                    title: Text(
                                      animal['regime'],
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(157, 54, 45, 41),
                                          fontSize: 14),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.home_filled,
                                        color: Colors.brown),
                                    title: Text(
                                      animal['zones'],
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(157, 54, 45, 41),
                                          fontSize: 14),
                                    ),
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      ListAnimal(
                                                          classe: animal[
                                                              'classe']))));
                                        },
                                        child: Text(
                                            "#${Classe.classes[animal['classe']].nomCls}"),
                                      ),
                                    ),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text("#${animal['famille']}"),
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              );
            } else {
              return const Text("dosn't exist");
            }
          }
        }),
      ),
    );
  }

  _tableRow(text1, text2, icon) {
    return TableRow(
      children: [
        Row(children: [
          Icon(icon, color: Colors.brown),
          const SizedBox(width: 5),
          Text(
            text1,
            style: const TextStyle(
                color: Colors.brown, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ]),
        Text(
          text2,
          style: const TextStyle(
              color: Color.fromARGB(157, 54, 45, 41), fontSize: 14),
        ),
      ],
    );
  }
}
