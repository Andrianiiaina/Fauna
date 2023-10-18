import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
export 'condition.dart';
export 'mention.dart';
export 'help.dart';

class ParameterScreen extends StatelessWidget {
  const ParameterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(193, 0, 0, 0),
        elevation: 1,
        title: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(Icons.settings, size: 27)),
            const Text("Paramètres"),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Icons.safety_check
            _typeParams(context, "Condition d'utilisation",
                Icons.safety_divider, '/condition'),
            _typeParams(context, "Mentions légales", Icons.balance, '/mention'),
            _typeParams(context, "Besoin d'aide", Icons.help, '/help'),
          ],
        ),
      ),
    );
  }

  Widget _typeParams(
      BuildContext context, String name, IconData icon, String route) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Container(
          margin: const EdgeInsets.only(
            top: 8,
            bottom: 8,
          ),
          child: Row(
            children: [
              Container(
                child: Icon(
                  icon,
                ),
                margin: const EdgeInsets.only(right: 8),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )),
    );
  }
}
