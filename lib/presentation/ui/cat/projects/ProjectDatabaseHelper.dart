import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Project.dart';

class ProjectDatabaseHelper {
  static final ProjectDatabaseHelper instance = ProjectDatabaseHelper._privateConstructor();
  static Database? _database;

  ProjectDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'projects.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE projects(
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        title TEXT,
        description TEXT
      )
    ''');
  }

  Future<int> insertProject(Project project) async {
    Database db = await instance.database;
    return await db.insert('projects', project.toMap());
  }

  Future<List<Project>> getProjectsByCategoryId(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      'projects',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Project(
        id: maps[i]['id'],
        categoryId: maps[i]['categoryId'],
        title: maps[i]['title'],
        description: maps[i]['description'],
      );
    });
  }

  Future<int> updateProject(Project project) async {
    Database db = await instance.database;
    return await db.update(
      'projects',
      project.toMap(),
      where: 'id = ?',
      whereArgs: [project.id],
    );
  }

  Future<int> deleteProject(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'projects',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}