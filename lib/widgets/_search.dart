import 'package:fauna_scan/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget searchField(BuildContext context) {
  return TextFormField(
      readOnly: true,
      decoration: const InputDecoration(
        isDense: true,
        filled: true,
        hintText: "Trouver un animal",
        hintStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          elevation: 1,
          builder: (_) => Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            child: SearchAnimal(),
          ),
        );
      });
}

Widget searchRow(BuildContext context) {
  return Row(
    children: [
      Expanded(flex: 5, child: searchField(context)),
      Expanded(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: () {
            context.go('/add_espece');
          },
          icon: const Icon(Icons.add),
        ),
      ),
    ],
  );
}
