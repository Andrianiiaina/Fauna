//import 'package:fauna_scan/animals/show_animal.dart';
import 'package:flutter/material.dart';
import 'models/database_manager.dart';
import 'animals/animal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fauna-scan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
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
    const AnimalPage(),
    const AnimalPage(),
    const AnimalPage(),
  ];
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    //initialisation SQFLITE
    //  handler = DatabaseManager();
    // handler.initializeDB().whenComplete(() async {
    //await
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingButton(),
      bottomNavigationBar: _customBottomNav(context),
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
              IconButton(
                  onPressed: () {
                    _onTapped(0);
                  },
                  icon: const Icon(Icons.home)),
              SizedBox(width: MediaQuery.of(context).size.width * 0.10),
              IconButton(
                  onPressed: () {
                    _onTapped(1);
                  },
                  icon: const Icon(Icons.photo_album)),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _onTapped(2);
                  },
                  icon: const Icon(Icons.person)),
              SizedBox(width: MediaQuery.of(context).size.width * 0.10),
              IconButton(
                  onPressed: () {
                    _onTapped(3);
                  },
                  icon: const Icon(Icons.settings)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _floatingButton() {
  return FloatingActionButton(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 58, 149, 73),
    onPressed: () {},
    child: const Icon(Icons.qr_code, color: Colors.black),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
            width: 5.0, color: Colors.white, style: BorderStyle.solid)),
  );
}
