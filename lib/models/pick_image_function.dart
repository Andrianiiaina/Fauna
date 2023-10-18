import 'package:fauna_scan/animals/scan_result.dart';
import 'package:flutter/material.dart';
import '../../models/classifier.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../../models/database_manager.dart';

final labels = [
  "aye",
  "black lemur",
  "coquerel",
  "eulemur coronatus",
  "eulemur fulvus",
  "fossa",
  "hapalemur griseus",
  "indri indri",
  "maki catta",
  "mangouste",
  "microcebus",
  "porc epique",
  "propithecus coronatus",
  "red ruffed",
  "soyeux",
  "tenrec zebre",
  "tortue",
  "unica"
];
String faunaName = "";
final handler = DatabaseManager();

Future<ClassifierModel> loadModel() async {
  final interpreter = await Interpreter.fromAsset("files/modele.tflite");
  final inputShape = interpreter.getInputTensor(0).shape;
  final outputShape = interpreter.getOutputTensor(0).shape;
  final inputType = interpreter.getInputTensor(0).type;
  final outputType = interpreter.getOutputTensor(0).type;
  return ClassifierModel(
    interpreter: interpreter,
    inputShape: inputShape,
    outputShape: outputShape,
    inputType: inputType,
    outputType: outputType,
  );
}

Future pickImage(type, BuildContext context) async {
  var pickedImage;
  final ImagePicker _picker = ImagePicker();
  (type == 0)
      ? pickedImage = await _picker.getImage(source: ImageSource.gallery)
      : pickedImage = await _picker.getImage(source: ImageSource.camera);

  if (pickedImage != null) {
    //stockage et affichage image
    File imagefile = File(pickedImage.path);

    //traitement données
    List<int> imageB = await imagefile.readAsBytes();
    img.Image image = img.decodeImage(Uint8List.fromList(imageB))!;
    img.Image resize = img.copyResize(image, width: 75, height: 75);
    List<List<List<double>>> imageData = [];
    for (int y = 0; y < resize.height; y++) {
      List<List<double>> row = [];
      for (int x = 0; x < resize.width; x++) {
        int pixel = resize.getPixel(x, y);
        int red = img.getRed(pixel);
        int green = img.getGreen(pixel);
        int blue = img.getBlue(pixel);
        double normaRed = red / 255;
        double normaGreen = green / 255;
        double normaBlue = blue / 255;
        row.add([normaRed, normaGreen, normaBlue]);
      }
      imageData.add(row);
    }
    List<List<double>> output = [List.filled(18, 0.0)];
    final model = await loadModel();
    try {
      model.interpreter.run([imageData], output);
      int index = 0;
      double pourcentage = 0;
      for (int i = 0; i < output[0].length; i++) {
        if (output[0][i] > output[0][index]) {
          index = i;
          pourcentage = output[0][index] * 100;
        }
      }
      int id = -1;
      await handler.getAllAnimals().then((value) {
        id = value
            .firstWhere((element) =>
                element.nom.toLowerCase() == labels[index].toLowerCase())
            .id;
      });

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ScanResultPage(
              id: id,
              currentImage: pickedImage,
              percentage: "${pourcentage.round()}")),
        ),
      );
    } catch (e) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => ScanResultPage(
              id: -1, currentImage: pickedImage, percentage: "0")),
        ),
      );
    }
  }
}
