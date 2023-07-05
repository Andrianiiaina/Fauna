import 'package:fauna_scan/animals/show_animal.dart';
import 'package:fauna_scan/models/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: const EdgeInsets.only(right: 12),
            child: const Icon(Icons.person),
          )
        ],
        title: const Icon(Icons.menu),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('LES FAMEUX FAUNES', style: TextStyle(fontSize: 20)),
            const Text('DE MADAGASCAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            const SizedBox(height: 20),
            _searchField(),
            const SizedBox(height: 20),
            TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              tabs: const [
                Tab(child: Text('Mammifère')),
                Tab(child: Text('Insectes')),
                Tab(child: Text('Oiseaux')),
                Tab(child: Text('Réptiles')),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: TabBarView(controller: _tabController, children: [
                Container(child: _listEspece(1)),
                Container(child: _listEspece(1)),
                Container(child: _listEspece(2)),
                Container(child: _listEspece(4)),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchField() {
    return TextFormField(
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
    );
  }

  Widget _listEspece(int q) {
    List<Animal> animals = Animal.listOfAnimals
        .where((element) => element.famille == q)
        .take(4)
        .toList();
    return MasonryGridView.count(
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
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken),
                    image: AssetImage(animals[index].image),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    textColor: Colors.white,
                    title: Text(
                      animals[index].nom.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(animals[index].zones),
                  )),
            ),
          );
        });
  }
}
