import 'package:fauna_scan/animals/scan_result.dart';
import 'package:flutter/material.dart';
import '../classifier.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../models/database_manager.dart';

class scani extends StatefulWidget {
  const scani({Key? key}) : super(key: key);

  @override
  State<scani> createState() => _scaniState();
}

class _scaniState extends State<scani> {
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
  final ImagePicker _picker = ImagePicker();
  String faunaName = "";
  String currentImage = "";
  String imageFile = "";
  final handler = DatabaseManager();

  static Future<ClassifierModel> loadModel() async {
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

  Future<void> pickImage(type) async {
    var pickedImage;
    final ImagePicker _picker = ImagePicker();
    (type == 0)
        ? pickedImage = await _picker.getImage(source: ImageSource.gallery)
        : pickedImage = await _picker.getImage(
            source: ImageSource.camera,
            preferredCameraDevice: CameraDevice.rear);

    if (pickedImage != null) {
      //stockage et affichage image
      File imagefile = File(pickedImage.path);
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory('${appDir.path}/images');
      if (!imagesDir.existsSync()) imagesDir.createSync(recursive: true);
      final newImagePath =
          '${imagesDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg}';
      setState(() {
        currentImage = pickedImage.path;
        imageFile = newImagePath;
      });
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
        var id = 0;
        handler.getAllAnimals().then((value) {
          id = value.firstWhere((element) => element.nom == labels[index]).id;
        });

        setState(() {
          //faunaName = labels[index] + " à " + pourcentage.toString() + "%";
          //id à changer plus tard
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => ScanResultPage(
                  id: id,
                  currentImage: currentImage,
                  percentage: pourcentage.round().toString())),
            ),
          );
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'float',
      elevation: 3,
      backgroundColor: Colors.white,
      onPressed: () {
        pickImage(0);
      },
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
}
