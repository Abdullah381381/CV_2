import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Language {
  final int? id;
  final int categoryId;
  final String name;
  final String grade;

  Language({ this.id, required this.categoryId, required this.name, required this.grade});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'grade': grade,
    };
  }
}

class LanguageDatabaseHelper {
  static final LanguageDatabaseHelper instance = LanguageDatabaseHelper._privateConstructor();

  static const String tableName = 'languages';

  static Database? _database;

  LanguageDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'language_database.db');

    return await openDatabase(databasePath, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        categoryId INTEGER NOT NULL,
        name TEXT NOT NULL,
        grade TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertLanguage(Language language) async {
    final db = await instance.database;
    return await db.insert(tableName, language.toMap());
  }

  Future<List<Language>> getLanguagesByCategoryId(int categoryId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName, where: 'categoryId = ?', whereArgs: [categoryId]);
    return List.generate(maps.length, (i) {
      return Language(
        id: maps[i]['id'],
        categoryId: maps[i]['categoryId'],
        name: maps[i]['name'],
        grade: maps[i]['grade'],
      );
    });
  }


  Future<int> updateLanguage(Language language) async {
    Database db = await instance.database;
    return await db.update(
      'languages',
      language.toMap(),
      where: 'id = ?',
      whereArgs: [language.id],
    );
  }


  Future<int> deleteLanguages(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'languages',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

// Implement other CRUD operations as needed
}
