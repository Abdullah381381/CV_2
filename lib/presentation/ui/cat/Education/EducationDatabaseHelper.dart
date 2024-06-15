import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Education.dart';

class EducationDatabaseHelper {
  static final EducationDatabaseHelper instance = EducationDatabaseHelper._privateConstructor();
  static Database? _database;

  EducationDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'education.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE education(
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        courseOrDegree TEXT,
        schoolOrUniversity TEXT,
        grade TEXT,
        year INTEGER
      )
    ''');
  }

  Future<int> insertEducation(Education education) async {
    Database db = await instance.database;
    return await db.insert('education', education.toMap());
  }

  Future<List<Education>> getEducationByCategoryId(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      'education',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Education(
        id: maps[i]['id'],
        categoryId: maps[i]['categoryId'],
        courseOrDegree: maps[i]['courseOrDegree'],
        schoolOrUniversity: maps[i]['schoolOrUniversity'],
        grade: maps[i]['grade'],
        year: DateTime.fromMillisecondsSinceEpoch(maps[i]['year']),
      );
    });
  }

  Future<int> updateEducation(Education education) async {
    Database db = await instance.database;
    return await db.update(
      'education',
      education.toMap(),
      where: 'id = ?',
      whereArgs: [education.id],
    );
  }

  Future<int> deleteEducation(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'education',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}