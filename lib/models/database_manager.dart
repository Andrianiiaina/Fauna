import 'package:fauna_scan/models/bibliotheque.dart';
import 'package:sqflite/sqflite.Dart';
import 'animal.dart';
import 'famille.dart';
import 'genre.dart';

class DatabaseManager {
  final pathDB = 'nana.db';
  initializeDB() async {
    return openDatabase(pathDB, version: 1,
        onCreate: (database, version) async {
      await database.execute(
          ''' CREATE TABLE famille(idFam INTEGER PRIMARY KEY  AUTOINCREMENT, nomFam TEXT,descriptionFam TEXT)''');
      await database.execute(
          ''' CREATE TABLE genre(idGenre INTEGER PRIMARY KEY  AUTOINCREMENT, nomGenre TEXT,descriptionGenre TEXT)''');
      await database.execute(
          ''' CREATE TABLE bibliotheque(idBiblio INTEGER PRIMARY KEY  AUTOINCREMENT, nomAnimal TEXT, imageAnimal TEXT,descriptionAnimal TEXT)''');
      await database.execute(
          ''' CREATE TABLE animal(id INTEGER PRIMARY KEY AUTOINCREMENT, nom TEXT,regime TEXT, estVertebre INTEGER, image TEXT,zones TEXT,description TEXT,classe INTEGER, genre INTEGER,espece TEXT,info TEXT, famille INTEGER, FOREIGN KEY(famille) REFERENCES famille (idFam),FOREIGN KEY(genre) REFERENCES genre (idGenre))''');

      for (var data in Famille.listOfFamilles) {
        await database.insert('famille', data.toMap());
      }

      for (var genre in Genre.genres) {
        await database.insert('genre', genre.toMap());
      }

      for (var animal in Animal.listOfAnimals) {
        await database.insert('animal', animal.toMap());
      }

      //  for (var animal in Bibliotheque.listOfAnimals) {
      //await database.insert('bibliotheque', animal.toMap());
      // }
      database.close();
    });
  }

  Future<Map<String, dynamic>?> fetchAnimal(int id) async {
    final Database db = await openDatabase(pathDB);
    List<Map<String, Object?>> maps = await db.rawQuery(
        '''SELECT animal.nom, animal.regime, animal.zones, animal.image,animal.classe,animal.espece,animal.description,animal.info,
        genre.nomGenre as genre, 
        famille.nomFam as famille
        FROM animal 
        INNER JOIN genre ON genre.idGenre=animal.genre
        INNER JOIN famille ON famille.idFam=animal.famille
        WHERE id = $id
        ''');
    db.close();
    return maps.isNotEmpty ? maps.first : null;
  }

  Future<List<Map<String, dynamic>>?> fetchAnimals() async {
    final Database db = await openDatabase(pathDB);
    List<Map<String, Object?>> maps = await db.rawQuery(
        '''SELECT animal.id, animal.nom, animal.regime, animal.zones, animal.image,animal.classe,animal.espece,animal.description,animal.info,
        genre.nomGenre as genre, 
        famille.nomFam as famille
        FROM animal 
        INNER JOIN genre ON genre.idGenre=animal.genre
        INNER JOIN famille ON famille.idFam=animal.famille
        ''');
    db.close();
    return maps.isNotEmpty ? maps.toList() : null;
  }

  Future<List<Animal>> getAllAnimals() async {
    final Database db = await openDatabase(pathDB);
    final List<Map<String, Object?>> queryResult = await db.query('animal');

    return queryResult.map((e) => Animal.fromMap(e)).toList();
  }

  Future<List<Bibliotheque>> getBiblioAnimals() async {
    final Database db = await openDatabase(pathDB);
    final List<Map<String, Object?>> queryResult =
        await db.query('bibliotheque');

    return queryResult.map((e) => Bibliotheque.fromMap(e)).toList();
  }

  Future<void> insertBibliotheque(Bibliotheque animal) async {
    final Database db = await openDatabase(pathDB);
    List<Map<String, Object?>> maps = await db.query('bibliotheque',
        where: 'nomAnimal = ? AND imageAnimal=?',
        whereArgs: [animal.nomAnimal, animal.imageAnimal]);

    maps.isEmpty ? await db.insert('bibliotheque', animal.toMap()) : null;

    db.close();
  }

  Future<void> deleteBibliotheque(int id) async {
    final Database db = await openDatabase(pathDB);
    await db.delete('bibliotheque', where: 'idBiblio=?', whereArgs: [id]);
    db.close();
  }
}
