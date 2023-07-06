import 'package:flutter/material.dart';

Widget searchField() {
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
      prefixIcon: Icon(Icons.search),
    ),
  );
}

Widget searchRow() {
  return Row(
    children: [
      Expanded(flex: 5, child: searchField()),
      Expanded(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ),
    ],
  );
}
