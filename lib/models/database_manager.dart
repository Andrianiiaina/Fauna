import 'package:sqflite/sqflite.Dart';
import 'animal.dart';
import 'famille.dart';
import 'espece.dart';
import 'genre.dart';

class DatabaseManager {
  final pathDB = 'azzfo.db';
  initializeDB() async {
    return openDatabase(pathDB, version: 1,
        onCreate: (database, version) async {
      await database.execute(
          ''' CREATE TABLE famille(idFam INTEGER PRIMARY KEY  AUTOINCREMENT, nomFam TEXT,descriptionFam TEXT)''');
      await database.execute(
          ''' CREATE TABLE espece(idEsp INTEGER PRIMARY KEY  AUTOINCREMENT, nomEsp TEXT,descriptionEsp TEXT)''');
      await database.execute(
          ''' CREATE TABLE genre(idGenre INTEGER PRIMARY KEY  AUTOINCREMENT, nomGenre TEXT,descriptionGenre TEXT)''');
      // await database.execute(
      //   ''' CREATE TABLE texture(idText INTEGER PRIMARY KEY  AUTOINCREMENT, nomText TEXT, couleur TEXT,descriptionText TEXT)''');
      //  await database.execute(
      //    ''' CREATE TABLE caracteristique(idCarac INTEGER PRIMARY KEY  AUTOINCREMENT,nbrPattes TEXT, nomCarac TEXT,descriptionCarac TEXT)''');
      await database.execute(
          ''' CREATE TABLE animal(id INTEGER PRIMARY KEY AUTOINCREMENT, nom TEXT,regime TEXT, estVertebre INTEGER, image TEXT,zones TEXT,caracteristique INTEGER,classe INTEGER, genre INTEGER,espece INTEGER,texture INTEGER, famille INTEGER, FOREIGN KEY(famille) REFERENCES famille (idFam), FOREIGN KEY(espece) REFERENCES espece (idEsp),FOREIGN KEY(genre) REFERENCES genre (idGenre))''');

      for (var data in Famille.listOfFamilles) {
        await database.insert('famille', data.toMap());
      }

      for (var genre in Genre.genres) {
        await database.insert('genre', genre.toMap());
      }

      for (var espece in Espece.especes) {
        await database.insert('espece', espece.toMap());
      }

      for (var animal in Animal.listOfAnimals) {
        await database.insert('animal', animal.toMap());
      }
      database.close();
    });
  }

  Future<Map<String, dynamic>?> fetchAnimal(int id) async {
    final Database db = await openDatabase(pathDB);
    List<Map<String, Object?>> maps = await db.rawQuery(
        '''SELECT animal.nom, animal.regime, animal.zones, animal.image,animal.classe,
        genre.nomGenre as genre, 
        famille.nomFam as famille,
        espece.nomEsp as espece, espece.descriptionEsp as descriptionEsp
        FROM animal 
        INNER JOIN genre ON genre.idGenre=animal.genre
        INNER JOIN famille ON famille.idFam=animal.famille
        INNER JOIN espece ON espece.idEsp=animal.espece
        WHERE id = $id
        ''');
    db.close();
    return maps.isNotEmpty ? maps.first : null;
  }

  Future<List<Animal>> getAllAnimals() async {
    final Database db = await openDatabase(pathDB);
    final List<Map<String, Object?>> queryResult = await db.query('animal');

    return queryResult.map((e) => Animal.fromMap(e)).toList();
  }
}
