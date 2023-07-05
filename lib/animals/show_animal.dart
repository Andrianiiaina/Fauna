import '/models/animal.dart';
import 'package:flutter/material.dart';

class ShowAnimal extends StatefulWidget {
  final int id;
  const ShowAnimal({Key? key, required this.id}) : super(key: key);

  @override
  State<ShowAnimal> createState() => _ShowAnimalState();
}

class _ShowAnimalState extends State<ShowAnimal> {
  late Animal animal;
  @override
  void initState() {
    super.initState();
    animal = Animal.listOfAnimals[widget.id];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(animal.image), fit: BoxFit.cover)),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 50,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          animal.nom.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'nom scientifique',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 63, 123, 65),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _listTile(
                        "Description",
                        Text(
                          "Lorem ipsum don't know la suite, des cript dfges cri  escri ption de Lorem ipsum don't know la suite, ce fouc, des cript dfgescri  escription de ce fouc, des cript dfgescri description de ce fouc, des cript dfgescri ption de ce lorem upsom",
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _listTile(
                          "Information",
                          Table(
                            children: [
                              TableRow(children: [
                                Text('Famille'),
                                Text("animal.famille")
                              ]),
                              TableRow(children: [Text('Espece'), Text('dfg')]),
                              TableRow(children: [Text('Classe'), Text('dfg')]),
                              TableRow(children: [
                                Text('Region'),
                                Text('animal-region')
                              ]),
                            ],
                          )),
                    ],
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _listTile(title, subtitle) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 14),
    ),
    subtitle: subtitle,
  );
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
            
            ],
          ),
        ),
      ],
    ))
 */