import 'package:fauna_scan/animals/show_animal.dart';
import 'package:fauna_scan/models/classe.dart';
import 'package:flutter/material.dart';
import 'package:fauna_scan/models/animal.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/database_manager.dart';
import '../widgets/search_results.dart';

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
        elevation: 1,
        foregroundColor: const Color.fromARGB(193, 0, 0, 0),
        leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                elevation: 1,
                builder: (_) => Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.topCenter,
                  child: const SearchAnimal(),
                ),
              );
            }),
        title: Text(Classe.classes[widget.classe].nomCls,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                ShowAnimal(id: animals[index].id)),
                          ),
                        );
                      },
                      child: Container(
                        margin: (index == 1)
                            ? const EdgeInsets.only(top: 15)
                            : const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage(
                                    Animal.getLink(animals[index].image)[0]),
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              animals[index].nom,
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    );

                    //CardAnimal(animal: animals[index]);
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
