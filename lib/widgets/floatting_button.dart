import 'package:flutter/material.dart';

import '../models/pick_image_function.dart';

class ScanAnimalButton extends StatefulWidget {
  const ScanAnimalButton({Key? key}) : super(key: key);

  @override
  State<ScanAnimalButton> createState() => _ScanAnimalButtonState();
}

class _ScanAnimalButtonState extends State<ScanAnimalButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'float',
      elevation: 3,
      //backgroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 58, 149, 73),
      onPressed: () {
        pickImage(1, context);
      },
      child: const Icon(
        Icons.qr_code_rounded,
        //color: Color.fromARGB(255, 58, 149, 73),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(
              width: 3.0, color: Colors.white, style: BorderStyle.solid)),
    );
  }
}
