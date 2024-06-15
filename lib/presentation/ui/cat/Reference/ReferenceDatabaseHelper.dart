import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Reference.dart';

class ReferenceDatabaseHelper {
  static final ReferenceDatabaseHelper instance = ReferenceDatabaseHelper._privateConstructor();

  static const String tableName = 'reference_entries'; // Changed table name

  static Database? _database;

  ReferenceDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'reference_database.db');

    return await openDatabase(databasePath, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        university TEXT NOT NULL,
        phone TEXT NOT NULL,
        email TEXT NOT NULL,
        categoryId INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertReference(Reference reference) async {
    final db = await instance.database;
    return await db.insert(tableName, reference.toMap());
  }

  Future<Reference?> getReference() async {
    final db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableName, limit: 1);
    if (maps.isNotEmpty) {
      return Reference(
        id: maps[0]['id'],
        name: maps[0]['name'],
        university: maps[0]['university'],
        phone: maps[0]['phone'],
        email: maps[0]['email'],
        categoryId: maps[0]['categoryId'],
      );
    }
    return null;
  }

  Future<int> updateReference(Reference reference) async {
    final db = await instance.database;
    return await db.update(
      tableName,
      reference.toMap(),
      where: 'id = ?',
      whereArgs: [reference.id],
    );
  }


  Future<Reference?> getReferenceByCategoryId(int categoryId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName, where: 'categoryId = ?', whereArgs: [categoryId]);

    if (maps.isNotEmpty) {
      return Reference(
        id: maps[0]['id'],
        name: maps[0]['name'],
        university: maps[0]['university'],
        phone: maps[0]['phone'],
        email: maps[0]['email'],
        categoryId: maps[0]['categoryId'],
      );
    }
    return null;
  }


  Future<int> deleteReference(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
