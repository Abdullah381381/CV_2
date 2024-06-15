import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'CategoryMedul.dart';

class CategoryDatabaseHelper {
  static final CategoryDatabaseHelper instance = CategoryDatabaseHelper._privateConstructor();

  static Database? _database;

  CategoryDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'categories.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
  }

  Future<int> insertCategory(Map<String, dynamic> category) async {
    Database db = await instance.database;
    return await db.insert('categories', category);
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    Database db = await instance.database;
    return await db.query('categories');
  }

  Future<int> updateCategory(Category category) async {
    Database db = await instance.database;
    return await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  // Delete a category by ID
  Future<int> deleteCategory(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}