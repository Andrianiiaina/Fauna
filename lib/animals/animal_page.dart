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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.person),
          )
        ],
      ),
      drawer: MenuDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title:
                  Text('LES FAUNES ENDEMIQUES', style: TextStyle(fontSize: 20)),
              subtitle: Text("DE MADAGASCAR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
            const SizedBox(height: 5),
            searchRow(context),
            const SizedBox(height: 5),
            TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              tabs: const [
                Tab(child: Text('Mammifère')),
                Tab(child: Text('Réptiles')),
                Tab(child: Text('Oiseaux')),
                Tab(child: Text('Insectes')),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.54,
              child: TabBarView(controller: _tabController, children: [
                _listEspece(0),
                _listEspece(1),
                _listEspece(2),
                _listEspece(3),
              ]),
            ),
          ],
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

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          Image(image: AssetImage('assets/oiseaux/mesite_varie.jpg')),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Nous noter"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Vous etes hors connexion')));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Partager l'application"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Vous etes hors connexion')));
            },
          ),
        ],
      ),
    );
  }
}
