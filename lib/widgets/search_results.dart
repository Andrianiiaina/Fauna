import "package:flutter/material.dart";
import '../models/animal.dart';
import '../models/database_manager.dart';
import '../animals/show_animal.dart';

class SearchAnimal extends StatefulWidget {
  const SearchAnimal({Key? key}) : super(key: key);

  @override
  State<SearchAnimal> createState() => _SearchAnimalState();
}

class _SearchAnimalState extends State<SearchAnimal> {
  List<Map<String, dynamic>>? animals = [];
  get_animals(String q) {
    handler.fetchAnimals().then((value) => animals = value!
        .where((element) =>
            element['nom'].toLowerCase().contains(q.toLowerCase()) ||
            element['espece']
                .toString()
                .toLowerCase()
                .contains(q.toLowerCase()) ||
            element['famille']
                .toString()
                .toLowerCase()
                .contains(q.toLowerCase()) ||
            element['genre'].toString().toLowerCase().contains(q.toLowerCase()))
        .toList());
    return animals;
  }

  final handler = DatabaseManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                isDense: true,
                filled: true,
                hintText: "Trouver un animal",
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (q) {
                if (q == '') {
                  setState(() {
                    animals = [];
                  });
                } else {
                  setState(() {
                    animals = get_animals(q);
                  });
                }
              },
            ),
            Container(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: animals!.length,
                itemBuilder: ((context, index) {
                  final animal = animals![index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ShowAnimal(id: animal['id'])),
                        ),
                      );
                    },
                    title: Text(animal['nom']),
                    subtitle: Text("${animal['espece']} ${animal['genre']}"),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
