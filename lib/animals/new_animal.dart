import 'package:fauna_scan/models/espece.dart';
import 'package:fauna_scan/models/famille.dart';
import 'package:fauna_scan/models/genre.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// ignore: use_key_in_widget_constructors
class AddEspeceScreen extends StatefulWidget {
  @override
  State<AddEspeceScreen> createState() => _AddEspeceScreenState();
}

class _AddEspeceScreenState extends State<AddEspeceScreen> {
  final _formKey = GlobalKey<FormState>();
  final especes = Espece.especes;
  final familles = Famille.listOfFamilles;
  final genres = Genre.genres;
  final nameController = TextEditingController();
  final regimeController = TextEditingController();
  List<DropdownMenuItem<String>> especeDrop = [];
  List<DropdownMenuItem<String>> familleDrop = [];
  List<DropdownMenuItem<String>> genreDrop = [];

  String imageFile = "";
  String currentImage = "";
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    _getSelectValue();
  }

  _getSelectValue() {
    for (int i = 0; i < especes.length; i++) {
      especeDrop.add(DropdownMenuItem<String>(
          value: especes[i].nomEsp, child: Text(especes[i].nomEsp)));
    }
    for (int i = 0; i < familles.length; i++) {
      familleDrop.add(DropdownMenuItem(
          value: familles[i].nomFam, child: Text(familles[i].nomFam)));
    }
    for (int i = 0; i < genres.length; i++) {
      genreDrop.add(DropdownMenuItem(
          value: genres[i].nomGenre, child: Text(genres[i].nomGenre)));
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    regimeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Envoie espece"),
      ),
      body: ListView(children: [
        Container(
            margin: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  setPhoto(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Nom de l'animal",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vous devez remplir ce champs";
                        }
                        return null;
                      },
                      controller: nameController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          labelText: "Description",
                          hintText: "Comme il est?",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vous devez remplir ce champs";
                        }
                        return null;
                      },
                      controller: regimeController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Régime alimentaire (*)",
                          hintText: "Ex: carnivore, herbivore, ...",
                          border: OutlineInputBorder()),
                      controller: regimeController,
                    ),
                  ),
                  isVerteberRadio(),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: "Espèce",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      items: especeDrop,
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: "Famille",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      items: familleDrop,
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: "Genre",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      items: genreDrop,
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // final name = nameController.text;
                            //final description = regimeController.text;
                            // ScaffoldMessenger().of(context).showSnackBar(
                            // 	const SnackBar(content: Text("Envoi en cours..."));
                            // );
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        },
                        child: const Text("Ajouter")),
                    width: double.infinity,
                    height: 50,
                  )
                ]))),
      ]),
    );
  }

  Widget setPhoto() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(children: [
        if (currentImage.isNotEmpty)
          Image.file(
            File(currentImage),
            height: 150,
            width: 150,
          ),
        FloatingActionButton(
          onPressed: () {
            _pickPhoto(ImageSource.gallery);
          },
          heroTag: 'image0',
          tooltip: 'profil_author',
          child: const Icon(
            Icons.photo,
            color: Colors.blue,
          ),
          backgroundColor: Colors.white,
        ),
      ]),
    );
  }

  Widget isVerteberRadio() {
    bool? isVertebre = false;
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Est vertebré",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Column(
            children: [
              ListTile(
                title: const Text("oui"),
                leading: Radio(
                    value: true,
                    groupValue: isVertebre,
                    onChanged: (bool? value) {
                      setState(() {
                        isVertebre = value;
                      });
                    }),
              ),
              ListTile(
                title: const Text("non"),
                leading: Radio(
                    value: false,
                    groupValue: isVertebre,
                    onChanged: (bool? value) {
                      setState(() {
                        isVertebre = value;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _pickPhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory('${appDir.path}/images');
      if (!imagesDir.existsSync()) imagesDir.createSync(recursive: true);

      final newImagePath =
          '${imagesDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg}';

      setState(() {
        currentImage = pickedFile.path;
        imageFile = newImagePath;
      });
    }
  }
}
