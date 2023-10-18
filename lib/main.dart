import 'package:flutter/material.dart';
import 'models/database_manager.dart';
import 'animals/animal_page.dart';
import 'widgets/floatting_button.dart';
import 'parameters/parameter.dart';
import 'routers.dart';
import 'animals/add_espece_screen.dart';
import 'bibliotheque_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseManager().initializeDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fauna-scan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseManager handler;
  int _selectedIndex = 0;
  final screens = [
    const AnimalPage(),
    const BibliothequePage(),
    AddEspeceScreen(),
    const ParameterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const ScanAnimalButton(),
      bottomNavigationBar: _customBottomNav(context),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _customBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(style: BorderStyle.solid, color: Colors.white),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _changeScreen(0, Icons.home),
              SizedBox(width: MediaQuery.of(context).size.width * 0.10),
              _changeScreen(1, Icons.photo_album)
            ],
          ),
          Row(
            children: [
              _changeScreen(2, Icons.person),
              SizedBox(width: MediaQuery.of(context).size.width * 0.10),
              _changeScreen(3, Icons.settings)
            ],
          ),
        ],
      ),
    );
  }

  Widget _changeScreen(int index, IconData icon) {
    return IconButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        icon: Icon(
          icon,
          color: index == _selectedIndex
              ? const Color.fromARGB(199, 0, 0, 0)
              : const Color.fromARGB(255, 96, 93, 93),
          size: index == _selectedIndex ? 27 : 25,
        ));
  }
}
