import 'package:sqflite/sqflite.Dart';
import 'animal.dart';
import 'famille.dart';

class DatabaseManager {
  Future<Database> initializeDB() async {
    return openDatabase(
      'scan.db',
      version: 1,
      onCreate: (database, version) async {
        _createOtherTable(database);
        _createAnimalTable(database);
      },
    );
  }

  Future<void> _createOtherTable(Database database) async {
    await database.execute(
        ''' CREATE TABLE famille(idFam INTEGER PRIMARY KEY  AUTOINCREMENT, nomFam TEXT,descriptionFam TEXT)''');
    await database.execute(
        ''' CREATE TABLE espece(idEsp INTEGER PRIMARY KEY  AUTOINCREMENT, nomEsp TEXT,descriptionEsp TEXT)''');
    await database.execute(
        ''' CREATE TABLE classe(idCls INTEGER PRIMARY KEY  AUTOINCREMENT, nomCls TEXT,descriptionCls TEXT)''');
    await database.execute(
        ''' CREATE TABLE texture(idText INTEGER PRIMARY KEY  AUTOINCREMENT, nomText TEXT, couleur TEXT,descriptionText TEXT)''');
    await database.execute(
        ''' CREATE TABLE caracteristique(idCarac INTEGER PRIMARY KEY  AUTOINCREMENT,nbrPattes TEXT, nomCarac TEXT,descriptionCarac TEXT)''');
  }

  Future<void> _createAnimalTable(Database database) async {
    await database.execute(
        ''' CREATE TABLE animal(id INTEGER PRIMARY KEY AUTOINCREMENT, nom TEXT,regime TEXT, estVertebre INTEGER, image TEXT,zones TEXT,caracteristique INTEGER,classe INTEGER,espece INTEGER,texture INTEGER, famille INTEGER, FOREIGN KEY(famille) REFERENCES famille (idFam), FOREIGN KEY(espece) REFERENCES espece (idEsp), FOREIGN KEY(caracteristique) REFERENCES caracteristique (idCarac), FOREIGN KEY(texture) REFERENCES texture (idText),FOREIGN KEY(classe) REFERENCES classe (idCls))''');
  }

  //insertion d'une liste de famille (flemme de faire des champs d'entrée)
  Future<int> insertFamilles(List<Famille> familles) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var famille in familles) {
      result = await db.insert('famille', famille.toMap());
    }
    return result;
  }

  Future<int> insertAnimal(List<Animal> animals) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var animal in animals) {
      result = await db.insert('animal', animal.toMap());
    }
    return result;
  }

/*   Future<List<Famille>> getAllFamilles() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('famille');
    return queryResult.map((e) => Famille.fromMap(e)).toList();
  }

  Future<List<Animal>> getAllAnimals() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('animal');
    return queryResult.map((e) => Animal.fromMap(e)).toList();
  }*/
}
