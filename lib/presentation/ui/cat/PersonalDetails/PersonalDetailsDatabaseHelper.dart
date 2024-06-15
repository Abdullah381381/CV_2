
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'PersonalDetails.dart';

class PersonalDetailsDatabaseHelper {
  static final PersonalDetailsDatabaseHelper instance = PersonalDetailsDatabaseHelper._privateConstructor();
  static Database? _database;

  PersonalDetailsDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'personal_details.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE personal_details(
        id INTEGER PRIMARY KEY,
        categoryId INTEGER,
        name TEXT,
        address TEXT,
        email TEXT,
        phone TEXT,
        notes TEXT,
        photoBytes BLOB
      )
    ''');
  }

  Future<int> insertPersonalDetails(PersonalDetails personalDetails) async {
    Database db = await instance.database;
    return await db.insert('personal_details', personalDetails.toMap());
  }

  Future<PersonalDetails?> getPersonalDetailsByCategoryId(int categoryId) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(
      'personal_details',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    if (maps.isNotEmpty) {
      return PersonalDetails(
        id: maps[0]['id'],
        categoryId: maps[0]['categoryId'],
        name: maps[0]['name'],
        address: maps[0]['address'],
        email: maps[0]['email'],
        phone: maps[0]['phone'],
        photo: maps[0]['photoBytes'],
        notes: maps[0]['notes']??"",
      );
    }
    return null;
  }

  Future<int> updatePersonalDetails(PersonalDetails personalDetails) async {
    Database db = await instance.database;
    return await db.update(
      'personal_details',
      personalDetails.toMap(),
      where: 'id = ?',
      whereArgs: [personalDetails.id],
    );
  }

  Future<int> deletePersonalDetails(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'personal_details',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Uint8List imageToBytes(String imagePath) {
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    return Uint8List.fromList(imageBytes);
  }

  static File bytesToImage(Uint8List bytes, String savePath) {
    File imageFile = File(savePath);
    imageFile.writeAsBytesSync(bytes);
    return imageFile;
  }
}
