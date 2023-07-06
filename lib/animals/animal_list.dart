import 'package:fauna_scan/models/classe.dart';
import 'package:flutter/material.dart';
import 'package:fauna_scan/models/animal.dart';
import 'package:fauna_scan/animals/show_animal.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/database_manager.dart';

class ListAnimal extends StatefulWidget {
  final int classe;
  const ListAnimal({Key? key, required this.classe}) : super(key: key);

  @override
  State<ListAnimal> createState() => _ListAnimalState();
}

class _ListAnimalState extends State<ListAnimal> {
  List<Animal> animals = [];
  final handler = DatabaseManager();
  @override
  void initState() {
    super.initState();
    handler.getAllAnimals().then((value) {
      setState(() {
        animals =
            value.where((element) => element.classe == widget.classe).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: const Icon(Icons.search),
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
            ListTile(
              textColor: const Color.fromARGB(195, 59, 29, 7),
              title: Text(Classe.classes[widget.classe].nomCls,
                  style: const TextStyle(fontSize: 22)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: SingleChildScrollView(
                child: MasonryGridView.count(
                  controller: ScrollController(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: animals.length,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    ShowAnimal(id: animals[index].id))));
                      },
                      child: Container(
                        margin: (index == 1)
                            ? const EdgeInsets.only(top: 15)
                            : const EdgeInsets.all(0),
                        child: Column(children: [
                          Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(animals[index].image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20),
                              )),
                          Text(
                            animals[index].nom,
                            style: const TextStyle(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          ),
                        ]),
                      ),
                    );
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
