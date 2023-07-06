import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.help,
                size: 27,
              ),
            ),
            const Text("Besoin d'aide")
          ]),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("I'm the help page :)"),
        ));
  }
}
