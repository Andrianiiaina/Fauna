import 'package:flutter/material.dart';
import '../animals/show_animal.dart';

class CardAnimal extends StatelessWidget {
  final dynamic animal;
  const CardAnimal({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ShowAnimal(id: animal.id)),
          ),
        );
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height * 0.30,
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              image: AssetImage(animal.image),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(5),
            child: ListTile(
              textColor: Colors.white,
              title: Text(
                animal.nom.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              //subtitle: Text(animal.zones),
            )),
      ),
    );
  }
}
