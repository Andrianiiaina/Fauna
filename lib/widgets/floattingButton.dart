import 'package:flutter/material.dart';

Widget floattingButton() {
  return FloatingActionButton(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 58, 149, 73),
    onPressed: () {},
    child: const Icon(
      Icons.qr_code,
      color: Colors.white,
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
            width: 5.0, color: Colors.white, style: BorderStyle.solid)),
  );
}
