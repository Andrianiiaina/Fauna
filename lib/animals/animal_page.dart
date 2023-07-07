import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/_search.dart';
import '../widgets/card_animal.dart';
import '/animals/animal_list.dart';
import '/models/animal.dart';
import '../models/database_manager.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Animal> animals = [];
  final handler = DatabaseManager();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    handler.getAllAnimals().then((value) {
      setState(() {
        animals = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.person),
          )
        ],
        title: const Icon(Icons.menu),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                title:
                    Text('LES FAMEUX FAUNES', style: TextStyle(fontSize: 22)),
                subtitle: Text("DE MADAGASCAR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              const SizedBox(height: 10),
              searchRow(context),
              const SizedBox(height: 10),
              TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                tabs: const [
                  Tab(child: Text('Oiseaux')),
                  Tab(child: Text('Réptiles')),
                  Tab(child: Text('Insectes')),
                  Tab(child: Text('Mammifère')),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.54,
                child: TabBarView(controller: _tabController, children: [
                  _listEspece(2),
                  _listEspece(1),
                  _listEspece(3),
                  _listEspece(0),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listEspece(int idClasse) {
    final extraitClasses =
        animals.where((element) => element.classe == idClasse).take(6).toList();
    return MasonryGridView.count(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: extraitClasses.length + 1,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          //un voir plus à modifier si misy best way
          if (index == extraitClasses.length) {
            return TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ListAnimal(classe: idClasse))));
              },
              child: const Text(
                'voir plus...',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return CardAnimal(animal: extraitClasses[index]);
        });
  }
}
