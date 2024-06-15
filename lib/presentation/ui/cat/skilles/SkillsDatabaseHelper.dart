import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Skill_modele.dart';

class SkillsDatabaseHelper {
  static final SkillsDatabaseHelper instance = SkillsDatabaseHelper._privateConstructor();
  static Database? _database;

  SkillsDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'skills.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE skills(
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        name TEXT,
        level INTEGER,
        FOREIGN KEY (categoryId) REFERENCES categories(id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> insertSkill(Skill skill) async {
    Database db = await instance.database;
    return await db.insert('skills', skill.toMap());
  }

  Future<List<Skill>> getSkillsByCategoryId(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      'skills',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Skill(
        id: maps[i]['id'],
        categoryId: maps[i]['categoryId'],
        name: maps[i]['name'],
        level: maps[i]['level'],
      );
    });
  }

  Future<int> updateSkill(Skill skill) async {
    Database db = await instance.database;
    return await db.update(
      'skills',
      skill.toMap(),
      where: 'id = ?',
      whereArgs: [skill.id],
    );
  }

  Future<int> deleteSkill(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'skills',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}