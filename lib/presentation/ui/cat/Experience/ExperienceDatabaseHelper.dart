import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Experience.dart';

class ExperienceDatabaseHelper {
  static final ExperienceDatabaseHelper instance = ExperienceDatabaseHelper._privateConstructor();
  static Database? _database;

  ExperienceDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'experiences.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE experiences(
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        companyName TEXT,
        jobTitle TEXT,
        startDate INTEGER,
        endDate INTEGER,
        details TEXT
      )
    ''');
  }

  Future<int> insertExperience(Experience experience) async {
    Database db = await instance.database;
    return await db.insert('experiences', experience.toMap());
  }

  Future<List<Experience>> getExperiencesByCategoryId(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      'experiences',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Experience(
        id: maps[i]['id'],
        categoryId: maps[i]['categoryId'],
        companyName: maps[i]['companyName'],
        jobTitle: maps[i]['jobTitle'],
        startDate: DateTime.fromMillisecondsSinceEpoch(maps[i]['startDate']),
        endDate: DateTime.fromMillisecondsSinceEpoch(maps[i]['endDate']),
        details: maps[i]['details'],
      );
    });
  }

  Future<int> updateExperience(Experience experience) async {
    Database db = await instance.database;
    return await db.update(
      'experiences',
      experience.toMap(),
      where: 'id = ?',
      whereArgs: [experience.id],
    );
  }

  Future<int> deleteExperience(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'experiences',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
