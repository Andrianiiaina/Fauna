import 'package:fauna_scan/models/bibliotheque.dart';
import 'package:sqflite/sqflite.Dart';
import 'animal.dart';
import 'user.dart';

class DatabaseManager {
  final pathDB = 'faux1.db';
  initializeDB() async {
    return openDatabase(pathDB, version: 1,
        onCreate: (database, version) async {
      //await database.execute(
      // ''' CREATE TABLE famille(idFam INTEGER PRIMARY KEY  AUTOINCREMENT, nomFam TEXT,descriptionFam TEXT)''');
      //await database.execute(
      //   ''' CREATE TABLE genre(idGenre INTEGER PRIMARY KEY  AUTOINCREMENT, nomGenre TEXT,descriptionGenre TEXT)''');
      await database.execute(
          ''' CREATE TABLE bibliotheque(idBiblio INTEGER PRIMARY KEY  AUTOINCREMENT, nomAnimal TEXT, imageAnimal TEXT,descriptionAnimal TEXT)''');
      await database.execute(
          ''' CREATE TABLE animal(id INTEGER PRIMARY KEY AUTOINCREMENT, nom TEXT,regime TEXT, estVertebre INTEGER, image TEXT,zones TEXT,description TEXT,classe INTEGER, genre TEXT,espece TEXT,info TEXT, famille TEXT)''');
      await database.execute(
          ''' CREATE TABLE user(idUser INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,password TEXT,  picture TEXT)''');

      // for (var data in Famille.listOfFamilles) {
      //  await database.insert('famille', data.toMap());
      // }

      //for (var genre in Genre.genres) {
      //  await database.insert('genre', genre.toMap());
      //}

      for (var animal in Animal.listOfAnimals) {
        await database.insert('animal', animal.toMap());
      }
      await database.insert('user', {
        'idUser': 0,
        'name': "Alice Bob",
        'picture': "assets/images/user.jpg",
        'password': "password",
      });

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
        animal.genre, 
        animal.famille
        FROM animal 
        WHERE id = $id
        ''');
    db.close();
    return maps.isNotEmpty ? maps.first : null;
  }

  Future<List<Map<String, dynamic>>?> fetchAnimals() async {
    final Database db = await openDatabase(pathDB);
    List<Map<String, Object?>> maps = await db.rawQuery(
        '''SELECT animal.id, animal.nom, animal.regime, animal.zones, animal.image,animal.classe,animal.espece,animal.description,animal.info,
         animal.genre, 
        animal.famille
        FROM animal 
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

  Future<List<User>> getUsers(nom, pass) async {
    final Database db = await openDatabase(pathDB);
    final List<Map<String, Object?>> queryResult = await db.query('user');

    return queryResult.map((e) => User.fromMap(e)).toList();
  }
}
