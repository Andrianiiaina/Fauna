import 'package:fauna_scan/models/bibliotheque.dart';
import 'package:flutter/material.dart';
import '../models/database_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:io';

class BibliothequePage extends StatefulWidget {
  const BibliothequePage({Key? key}) : super(key: key);

  @override
  State<BibliothequePage> createState() => _BibliothequePageState();
}

class _BibliothequePageState extends State<BibliothequePage>
    with TickerProviderStateMixin {
  List<Bibliotheque> animals = [];
  final handler = DatabaseManager();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    handler.getBiblioAnimals().then((value) {
      setState(() {
        animals = value;
      });
    });
  }

  deleteBiblio(id) async {
    await handler.deleteBibliotheque(id);
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: const Color.fromARGB(193, 0, 0, 0),
        leading: const Icon(Icons.search),
        title: const Text("Bibliothèque",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 170,
              child: SingleChildScrollView(
                child: MasonryGridView.count(
                  controller: ScrollController(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: animals.length,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) => Container(
                                    alignment: Alignment.center,
                                    color: Colors.transparent,
                                    child: ElevatedButton(
                                        child:
                                            Text('Supprimer de ma collection'),
                                        onPressed: () {
                                          deleteBiblio(animals[index].idBiblio);
                                          Navigator.pop(context);
                                        }),
                                  ));
                        },
                        child: Container(
                          margin: (index == 1)
                              ? const EdgeInsets.only(top: 15)
                              : const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(animals[index].imageAnimal),
                                  width: 150,
                                ),
                              ),
                              Text(
                                animals[index].nomAnimal,
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
