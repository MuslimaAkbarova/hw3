import 'package:hw3/models/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnector {
  static const int _version = 1;
  static const String _dbname = "Foodish.db";
  static const String _dbpath = "assets/images/Foodish.db";

  static Future<Database> _getDB() async {
    // return openDatabase(join(await getDatabasesPath(), _dbname),
    return openDatabase(_dbpath,
    onCreate: (db, version) async => await db.execute("CREATE TABLE users(user_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, username TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL);"), version: _version
    );
  }

  static Future<int> addUser(User user) async {
    final db = await _getDB();
    return await db.insert("users", user.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUser(User user) async {
    final db = await _getDB();
    return await db.update("users", user.toJson(),
    where: 'user_id=?',
    whereArgs: [user.user_id],
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUser(User user) async {
    final db = await _getDB();
    return await db.delete("users",
    where: "user_id=?",
    whereArgs: [user.user_id],
    );
  }

  static Future<int?> userLogin(String email, String password) async {
    final db = await _getDB();
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
}