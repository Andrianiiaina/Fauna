import 'package:flutter/material.dart';

class ShowAnimal extends StatefulWidget {
  final int id;
  const ShowAnimal({Key? key, required this.id}) : super(key: key);

  @override
  State<ShowAnimal> createState() => _ShowAnimalState();
}

class _ShowAnimalState extends State<ShowAnimal> {
  @override
  Widget build(BuildContext context) {
    return const Text("show-animal page");
  }
}
