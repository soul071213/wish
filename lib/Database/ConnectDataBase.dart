import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wish/model/Lists.dart';
import 'package:wish/model/User.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'wish.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Lists(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            number INTEGER,
            fear TEXT,
            date TEXT,
            text TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE Users(
            id TEXT PRIMARY KEY,
            name TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertList(Lists list) async {
    final db = await getDatabase();

    await db.insert(
      'Lists',
      list.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertUser(User user) async {
    final db = await getDatabase();

    await db.insert(
      'Users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Lists>> getLists() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Lists');

    return List.generate(maps.length, (i) {
      return Lists(
        number: maps[i]['number'],
        fear: maps[i]['fear'],
        date: maps[i]['date'],
        text: maps[i]['text'],
      );
    });
  }

  Future<List<User>> getUsers() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('Users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        password: maps[i]['password'],
      );
    });
  }
}

extension ListsMapExtension on Lists {
  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'fear': fear,
      'date': date,
      'text': text,
    };
  }
}

extension UserMapExtension on User {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }
}
