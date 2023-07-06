import 'package:flutter/material.dart';

Widget floattingButton() {
  return FloatingActionButton(
    heroTag: 'float',
    elevation: 3,
    backgroundColor: Colors.white,
    onPressed: () {},
    child: const Icon(
      Icons.qr_code_rounded,
      color: Color.fromARGB(255, 58, 149, 73),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
            width: 5.0, color: Colors.transparent, style: BorderStyle.solid)),
  );
}
