import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Objective.dart';

class ObjectiveDatabaseHelper {
  static final ObjectiveDatabaseHelper instance = ObjectiveDatabaseHelper._privateConstructor();
  static Database? _database;

  ObjectiveDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'objective.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE objective(
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        objective TEXT
      )
    ''');
  }

  Future<int> insertObjective(Objective objective) async {
    Database db = await instance.database;
    return await db.insert('objective', objective.toMap());
  }

  Future<Objective?> getObjectiveByCategoryId(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      'objective',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    if (maps.isNotEmpty) {
      return Objective(
        id: maps[0]['id'],
        categoryId: maps[0]['categoryId'],
        objective: maps[0]['objective'],
      );
    }
    return null;
  }

  Future<int> updateObjective(Objective objective) async {
    Database db = await instance.database;
    return await db.update(
      'objective',
      objective.toMap(),
      where: 'id = ?',
      whereArgs: [objective.id],
    );
  }

  Future<int> deleteObjective(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'objective',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}