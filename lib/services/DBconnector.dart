import 'dart:io';
import 'package:hw3/models/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseConnector {
  
  static final DatabaseConnector _instance = DatabaseConnector._internal();
  factory DatabaseConnector() => _instance;

  late Database _database;

  Future<Database> get database async {
    return _database;
  }

  DatabaseConnector._internal();

  Future<Database> _initDatabase() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, "foodish.db");
    String path = "assets/foodish.db";

    return await openDatabase(path, version: 1,
    onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''"CREATE TABLE users(user_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL, username TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL);"
    ''');
  }

  Future<int> addUser(User user) async {
    final db = await database;
    return await db.insert("users", user.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update("users", user.toJson(),
    where: 'user_id=?',
    whereArgs: [user.user_id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deleteUser(User user) async {
    final db = await database;
    return await db.delete("users",
    where: "user_id=?",
    whereArgs: [user.user_id],
    );
  }

  Future<int?> userLogin(String email, String password) async {
    final db = await database;
    final result = await db.query(
    "users",
    columns: ["user_id"],
    where: "email=? AND password=?",
    whereArgs: [email, password],
  );

  if (result.isNotEmpty) {
    return result.first["user_id"] as int?;
  } else {
    return null;
  }
  }

  Future<void> init() async {
    _database = await _initDatabase();
  }

}