import 'package:fauna_scan/models/classe.dart';
import 'package:flutter/material.dart';
import '../models/database_manager.dart';
import 'animal_list.dart';

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
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.48,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(animal['image']),
                              fit: BoxFit.cover)),
                    ),
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
                                      "${animal['genre']} ${animal['espece']}",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 26,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Lorem ipsum don't know sum don't know la suite sum don't know la suite sum don't know la suite sum don't know la suitela suite  ipsum don't know la suite  ipsum don't know la suite  ipsum don't know la suite, des cript dfges cri  escri ption de Lorem ipsum don't know la suite, ce fouc, des cript dfgescri  escription de ce fouc, des cript dfgescri description de ce fouc, des cript dfgescri ption de ce lorem upsom",
                                    maxLines: 8,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Roboto",
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  Table(
                                    children: [
                                      _tableRow('Alimentation',
                                          animal['regime'], Icons.food_bank),
                                      _tableRow('Habitat', animal['zones'],
                                          Icons.home_filled),
                                    ],
                                  ),
                                  SizedBox(height: 20),
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

/**
 * pourcentage Si
 * ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width / 5,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundImage:
                                            AssetImage(animal.image)),
                                    Text("${index * 0.4 + 1}%")
                                  ],
                                ),
                              );
                            })),
                            //
            
 
 */